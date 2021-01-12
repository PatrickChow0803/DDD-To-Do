import 'package:ddd_to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_to_do/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';
import 'package:ddd_to_do/presentation/notes/note_form/misc/build_context_x.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      // makes it so that the snackbar only displays when it's full
      listenWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer lists? Activate premium 🤩',
            button: FlatButton(
              onPressed: () {},
              child: const Text(
                'BUY NOW',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      // Consumer gets rebuilt whenever there's a change in FormTodos
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            // shrinkWrap makes the ListView calculate it's vertical size based on its children
            shrinkWrap: true,
            itemCount: formTodos.value.size,
            itemBuilder: (context, index) {
              return TodoTile(
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    @required this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if the index is out of bounds, return a TodoItemPrimitive.empty()
    final todo = context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());

    return ListTile(
      leading: Checkbox(
        value: todo.done,
        onChanged: (value) {
          context.formTodos = context.formTodos.map(
            (listTodo) => listTodo == todo ? todo.copyWith(done: value) : listTodo,
          );
          context.read<NoteFormBloc>().add(NoteFormEvent.todosChanged(context.formTodos));
        },
      ),
    );
  }
}
