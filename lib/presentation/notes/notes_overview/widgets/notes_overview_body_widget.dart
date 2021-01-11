import 'package:ddd_to_do/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:ddd_to_do/presentation/notes/notes_overview/widgets/critical_failure_display_widget.dart';
import 'package:ddd_to_do/presentation/notes/notes_overview/widgets/error_note_card_widget.dart';
import 'package:ddd_to_do/presentation/notes/notes_overview/widgets/note_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// these are the placeholder note cards
// important thing here is to build the UI accordingly to the NoteWatcherBloc
// Since NoteWatcherBloc's job is to provide notes

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          // the state here holds all of the notes that I want to display
          loadSuccess: (state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                // state.notes contains the list of notes
                final note = state.notes[index];
                // if there's an error, display a container to signal a problem
                // this can occur if a todoItem has no text in it for example
                if (note.failureOption.isSome()) {
                  return ErrorNoteCard(note: note);
                  // else just display a regular container to show everything went well
                } else {
                  return NoteCard(note: note);
                }
              },
              itemCount: state.notes.size,
            );
          },
          // failure in getting ALL of the notes
          // this can occur if you're viewing someone's else's notes that you don't have permission to
          loadFailure: (state) {
            print(state.toString());
            return CriticalFailureDisplay(failure: state.noteFailure);
          },
        );
      },
    );
  }
}
