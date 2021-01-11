import 'package:ddd_to_do/application/notes/note_actor/note_actor_bloc.dart';
import 'package:ddd_to_do/domain/notes/note.dart';
import 'package:ddd_to_do/domain/notes/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation
        },
        onLongPress: () {
          final noteActorBloc = context.read<NoteActorBloc>();
          _showDeletionDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(fontSize: 18),
              ),
              // if there's todos in the note, display a list of optional widgets
              if (note.todos.length > 0) ...[
                const SizedBox(height: 4),
                // creates another line in the UI if there isn't enough space to display the todos
                // in a single line
                Wrap(
                  spacing: 8,
                  children: <Widget>[
                    // ... unwraps the list
                    // Ex: List<int> l1 = [1, 2, 3];
                    //     List<int> result = [0, ...l1];
                    ...note.todos
                        .getOrCrash()
                        // map the TodoItem into their respective widget
                        .map(
                          (todo) => TodoDisplay(todo: todo),
                        )
                        // converts the ktList into an iterable to make Flutter use this properly
                        .iter,
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletionDialog(BuildContext context, NoteActorBloc noteActorBloc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected note:'),
          content: Text(
            note.body.getOrCrash(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            FlatButton(
              onPressed: () {
                noteActorBloc.add(NoteActorEvent.deleted(note));
                Navigator.pop(context);
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}

// A todoo has a check mark and text next to it in a row.
class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({
    Key key,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (todo.done)
          Icon(
            Icons.check_box,
            color: Theme.of(context).accentColor,
          ),
        if (!todo.done)
          Icon(
            Icons.check_box_outline_blank,
            color: Theme.of(context).disabledColor,
          ),
        Text(todo.name.getOrCrash()),
      ],
    );
  }
}
