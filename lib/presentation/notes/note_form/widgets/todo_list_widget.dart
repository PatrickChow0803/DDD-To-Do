import 'package:ddd_to_do/application/notes/note_form/note_form_bloc.dart';
import 'package:ddd_to_do/domain/notes/value_objects.dart';
import 'package:ddd_to_do/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kt_dart/collection.dart';
import 'package:provider/provider.dart';
import 'package:ddd_to_do/presentation/notes/note_form/misc/build_context_x.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
                key: ValueKey(context.formTodos[index].id),
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

    // for setting the default text of a todowidget
    final textEditingController = useTextEditingController(text: todo.name);

    return Slidable(
      // creates the slide animation
      actionPane: const SlidableDrawerActionPane(),
      // makes the actions smaller
      actionExtentRatio: 0.15,
      // the actions that will appear on the right side
      secondaryActions: [
        IconSlideAction(
          icon: Icons.delete,
          caption: 'Delete',
          color: Colors.red,
          onTap: () {
            context.formTodos = context.formTodos.minusElement(todo);
            context.bloc<NoteFormBloc>().add(NoteFormEvent.todosChanged(context.formTodos));
          },
        )
      ],
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white70), borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (value) {
              context.formTodos = context.formTodos.map(
                (listTodo) => listTodo == todo ? todo.copyWith(done: value) : listTodo,
              );
              context.read<NoteFormBloc>().add(NoteFormEvent.todosChanged(context.formTodos));
            },
          ),
          title: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Todo',
              counterText: '',
              border: InputBorder.none,
            ),
            maxLength: TodoName.maxLength,
            onChanged: (value) {
              context.formTodos = context.formTodos.map(
                (listTodo) => listTodo == todo ? todo.copyWith(name: value) : listTodo,
              );
              context.read<NoteFormBloc>().add(NoteFormEvent.todosChanged(context.formTodos));
            },
            validator: (_) {
              return context.read<NoteFormBloc>().state.note.todos.value.fold(
                    // Failure stemming from the TodoList length should NOT be displayed by the individual TextFormFields
                    (f) => null,
                    (todoList) => todoList[index].name.value.fold(
                          (f) => f.maybeMap(
                            empty: (_) => 'Cannot be empty',
                            exceedingLength: (_) => 'Too long',
                            multiline: (_) => 'Has to be in a single line',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
