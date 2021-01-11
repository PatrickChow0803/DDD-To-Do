import 'package:ddd_to_do/application/notes/note_watcher/note_watcher_bloc.dart';
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
                if (note.failureOption.isSome()) {
                  return Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  );
                  // else just display a regular container to show everything went well
                } else {
                  return NoteCard(note: note);
                }
              },
              itemCount: state.notes.size,
            );
          },
          // failure in getting ALL of the notes
          loadFailure: (state) {
            print(state.toString());
            return Container(
              color: Colors.yellow,
              width: 200,
              height: 200,
            );
          },
        );
      },
    );
  }
}
