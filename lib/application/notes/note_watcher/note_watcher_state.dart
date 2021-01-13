part of 'note_watcher_bloc.dart';

@freezed
abstract class NoteWatcherState with _$NoteWatcherState {
  const factory NoteWatcherState.initial() = _Initial;
  const factory NoteWatcherState.loadInProgress() = _LoadInProgress;

  // look at domain/notes/i_note_repository for reference
  // The watchAll return type is Stream<Either<NoteFailure, KtList<Note>>> watchAll()
  // but because this is a bloc, the parameter list is more simple.
  // only pass in the list of notes
  const factory NoteWatcherState.loadSuccess(KtList<Note> notes) = _LoadSuccess;
  const factory NoteWatcherState.loadFailure(NoteFailure noteFailure) = _LoadFailure;
}
