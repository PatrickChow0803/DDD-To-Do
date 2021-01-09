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

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {}

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
