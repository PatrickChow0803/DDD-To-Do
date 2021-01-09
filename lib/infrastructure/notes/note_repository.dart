// LazySingleton is needed for injectable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_to_do/domain/notes/i_note_repository.dart';
import 'package:ddd_to_do/domain/notes/note.dart';
import 'package:ddd_to_do/domain/notes/note_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:ddd_to_do/infrastructure/core/firestore_helpers.dart';
import 'package:rxdart/rxdart.dart';

import 'note_dtos.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  // async* here because return type is a Stream, not a Future
  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    // need to manually import extension method from firestore_helpers
    final userDoc = await _firestore.userDocument();
    // note_dto has a field called serverTimeStamp,
    // we want to order the documents in which they come in by serverTimeStamp,
    // aka: The last note that was interacted with
    // yield* because .snapshots() returns a stream
    // the first .map is to get the correct data from snapshots
    // the second .map is to convert QuerySnapshot from .snapshots() to
    // Stream<Either<NoteFailure, KtList<Note>>>
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs.map((doc) => NoteDto.fromFirestore(doc).toDomain()).toImmutableList(),
          ),
          // need to manually import rxdart to use this extension method
          // this method is called when .map() throws an exception
        )
        .onErrorReturnWith((error) {
      if (error is FirebaseException && error.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    });
  }

  // Display a list of notes where the note hasn't finished all of their todos
  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        // maps snapshots to note entities
        .map(
          (snapshot) => snapshot.docs.map((doc) => NoteDto.fromFirestore(doc).toDomain()),
        )
        // using the map's notes iterable, create a KtList of notes
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                // return the notes where any of their todoItem isn't done
                .where((note) => note.todos.getOrCrash().any((todoItem) => !todoItem.done))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((error) {
      if (error is FirebaseException && error.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        // log.error(e.toString());
        return left(const NoteFailure.unexpected());
      }
    });
  }

  // since this has a return type of just a Future
  // use async and a try catch block
  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();

      // convert the note entity to a data transfer object
      final noteDto = NoteDto.fromDomain(note);

      // use .set instead of .add here because if we were to use .add,
      // Firebase would automatically generate an ID for the document.
      // But we're already generating an ID in the app, so therefore use the .set property
      // if no document exists, firebase creates the new document automatically.
      // if the document does exists, just update the values
      // since .set is an async operation, use await here
      await userDoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());

      // if nothing went wrong, return right(unit)
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {}

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
