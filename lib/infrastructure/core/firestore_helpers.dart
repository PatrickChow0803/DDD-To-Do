import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ddd_to_do/domain/auth/i_auth_facade.dart';
import 'package:ddd_to_do/domain/core/errors.dart';
import 'package:ddd_to_do/injection.dart';

// File contains extension methods for Firestore related code

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return Firestore.instance.collection('users').document(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
