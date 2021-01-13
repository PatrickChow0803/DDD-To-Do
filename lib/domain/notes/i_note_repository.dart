import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'note.dart';
import 'note_failure.dart';

// I in the class name stands for Interface
// Treat this abstract class as an Interface.

// Abstract classes can have constants, members, method stubs (methods without a body)
// whereas interfaces can only have constants and methods stubs.
abstract class INoteRepository {
  // watches all of the notes
  // notes come in as a stream and can either return a NoteFailure or a list of notes
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();

  // watchs only uncompleted notes
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();

  // When creating a note, you can either fail when creating it
  // or you can successfully create the note but nothing needs to be returned
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(Note note);
}
