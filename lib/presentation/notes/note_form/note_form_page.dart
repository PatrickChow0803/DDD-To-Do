import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_to_do/domain/notes/note.dart';
import 'package:ddd_to_do/injection.dart';
import 'package:ddd_to_do/presentation/routes/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteFormPage extends StatelessWidget {
  // if editedNote is null, that means that a new note is being created
  // if it isn't null, means that the note is being edited
  final Note editedNote;

  const NoteFormPage({
    Key key,
    @required this.editedNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          // optionOf - if editedNote is null, pass in none. if it isn't null, pass in some editedNote.
          getIt<NoteFormBloc>()..add(NoteFormEvent.initialized(optionOf(editedNote))),
      // use a BlocListener if you don't need the state or context
      // BLocConsumer if you DO need the state or context
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        // Only have FlushbarHelper appear when .saveFailureOrSuccessOption changes
        listenWhen: (p, c) => p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          // use fold to get rid of the option
          // if none, do nothing
          // if some, do something with the either data type
          state.saveFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    // map different NoteFailures to return a string to display to the ui
                    message: failure.map(
                      insufficientPermission: (_) => 'Insufficient permissions ❌',
                      unableToUpdate: (_) =>
                          "Couldn't update the note. Was it deleted from another device?",
                      unexpected: (_) => 'Unexpected error occured, please contact support.',
                    ),
                  ).show(context);
                },
                (_) {
                  ExtendedNavigator.of(context).popUntil(
                    (route) => route.settings.name == Routes.notesOverviewPage,
                  );
                },
              );
            },
          );
        },
        // only rebuild the builder when the user is saving
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) {
          // stack here so that the SavingInProgressOverlay displays above the Note Form
          return Stack(
            children: <Widget>[
              const NoteFormPageScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving)
            ],
          );
        },
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  // bool is used to determine if the SavingInProgressOverlay should be shown or not
  final bool isSaving;

  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // IgnorePointer makes it so that the background of the stack is clickable depending on the ignoring: value
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // visibility determines whether or not to display the child widget
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // use the BlocBuilder widget to determine if the text in the appbar should
        // be displaying either edit a note / create a note
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          // prevents unnecessary rebuild of the text widget
          // rebuild when previous != current which is never going to happen
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit a note' : 'Create a note');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // triggers the logic to first validate the note
              // then if everything is valid, everything will get saved to firestore
              context.read<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          )
        ],
      ),
    );
  }
}
