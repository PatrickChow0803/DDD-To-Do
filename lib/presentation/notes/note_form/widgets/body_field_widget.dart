import 'package:ddd_to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_to_do/domain/notes/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Use HookWidget here to get access to useTextEditingController();
// benefit of doing this is so that you don't need to dispose of it etc.
class BodyField extends HookWidget {
  const BodyField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // need this TextEditingController so that when editing a note, the text properly displays in
    // the body field instead of it being blank
    final textEditingController = useTextEditingController();

    // use BlocListener to get the state of the note
    return BlocListener<NoteFormBloc, NoteFormState>(
      // LISTENWHEN IS VERRRRRRY IMPORTANT HERE. THIS SAYS TO ONLY EXECUTE THE CODE IN THE LISTENER
      // IF THE PREVIOUS STATE OF ISEDITING != CURRENT STATE OF ISEDITING
      // WITHOUT THIS CODE, THE APP WOULD CRASH WHEN ADDING NEW NOTES SINCE NEW NOTES WOULDN'T HAVE A BODY
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: 'Note',
              // use '' here to get rid of the counterText
              counterText: '',
            ),
            maxLength: NoteBody.maxLength,
            // allows an infinite amount of lines. Return key now appears on the keyboard
            maxLines: null,
            // makes the note body field look bigger initially
            minLines: 5,
            // whenever text is added, perform the change inside of the Bloc to hold the value
            onChanged: (value) =>
                context.read<NoteFormBloc>().add(NoteFormEvent.bodyChanged(value)),
            // BlocBuilder provides the state of the bloc whenever it CHANGES
            // therefore if you used BlocBuilder here, you'd be 1 character off
            // Use instead context.read<NoteFormBloc>() to get the most up to date state
            // get the value of the body by using the state, and then fold since it's an either type
            validator: (_) => context.read<NoteFormBloc>().state.note.body.value.fold(
                  (f) => f.maybeMap(
                    empty: (f) => 'Cannot be empty',
                    exceedingLength: (f) => 'Exceeding length, max: ${f.max}',
                    orElse: () => null,
                  ),
                  // return null if the validator returns nothing. Meaning that there's no problem
                  (r) => null,
                ),
          )),
    );
  }
}
