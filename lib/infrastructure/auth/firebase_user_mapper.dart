import 'package:ddd_to_do/domain/auth/user.dart';
import 'package:ddd_to_do/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomainX on User {
  UniqueUser toDomain() {
    return UniqueUser(
      // uid comes from this object
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
