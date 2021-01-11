import 'package:auto_route/auto_route.dart';
import 'package:ddd_to_do/application/auth/auth_bloc.dart';
import 'package:ddd_to_do/application/notes/note_actor/note_actor_bloc.dart';
import 'package:ddd_to_do/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:ddd_to_do/injection.dart';
import 'package:ddd_to_do/presentation/notes/notes_overview/widgets/notes_overview_body_widget.dart';
import 'package:ddd_to_do/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:ddd_to_do/presentation/routes/router.gr.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provide the blocs needed
    return MultiBlocProvider(
      providers: [
        // bloc for getting the notes
        BlocProvider<NoteWatcherBloc>(
          create: (context) =>
              // when this page is reached, assume that all the notes will be watched initially
              getIt<NoteWatcherBloc>()..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        // bloc for deleting the notes
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          // listen to state changes. Such as log out will cause the auth status to change
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              // because I'm only interested in the unauthenticated state, use .maybeMap here instead of .map
              // maybeMap makes it so that you can ignore particular union cases
              state.maybeMap(
                unauthenticated: (_) => ExtendedNavigator.of(context).push(Routes.signInPage),
                // this is called for the other states besides unauthenticated
                orElse: () {},
              );
            },
          ),
          // listener for deleting notes
          // this listener will only be used to display FlushbarHelper to display failures.
          // therefore I only care about deleteFailure
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              // only interested in deleteFailure so use maybeMap
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    // state contains a noteFailure, which is a union where I want to handle all the cases
                    // therefore use .map
                    message: state.noteFailure.map(
                      unexpected: (_) =>
                          'Unexpected error occurred while deleting, please contact support.',
                      insufficientPermission: (_) => 'Insufficient permissions ❌',
                      // since we're deleting a note, not updating a note. should be impossible to get here.
                      unableToUpdate: (_) => 'Impossible error',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: <Widget>[
              UncompletedSwitch(),
            ],
          ),
          body: NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: Navigate to NoteFormPage
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
