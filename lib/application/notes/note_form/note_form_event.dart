part of 'note_form_bloc.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  // Option means nullable. It can be null or nonnull.
  const factory NoteFormEvent.initialized(Option<Note> initialNoteOption) = _Initialized;
  // this is the note body
  const factory NoteFormEvent.bodyChanged(String bodyStr) = _BodyChanged;
  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;
  // because Todos have three things, the text which it holds, done status, and an unique ID
  // because there are multiple things to check for, create a new class to check for them.
  const factory NoteFormEvent.todosChanged(KtList<TodoItemPrimitive> todos) = _TodosChanged;
  const factory NoteFormEvent.saved() = _Saved;
}
