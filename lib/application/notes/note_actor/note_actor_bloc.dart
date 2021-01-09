import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ddd_to_do/domain/notes/i_note_repository.dart';
import 'package:ddd_to_do/domain/notes/note.dart';
import 'package:ddd_to_do/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';

part 'note_actor_bloc.freezed.dart';

// this bloc is only for deleting
@injectable // makes it so that we can use getIt to obtain the instance of the bloc
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(const NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    // don't need to do yield* event.map like in the other blocs
    // this is because there's only 1 event possible in this bloc.
    // because delete is the only event possible, assume that you're currently working on it
    yield const NoteActorState.actionInProgress();
    // because .delete returns a future, await it's value
    final possibleFailure = await _noteRepository.delete(event.note);
    // once you get the value, react accordingly to either left or right
    yield possibleFailure.fold(
      (f) => NoteActorState.deleteFailure(f),
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}
