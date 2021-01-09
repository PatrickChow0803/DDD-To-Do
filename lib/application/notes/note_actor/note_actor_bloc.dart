import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ddd_to_do/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';

part 'note_actor_bloc.freezed.dart';

// this bloc is only for deleting
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  NoteActorBloc() : super(const NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
