import 'package:ddd_to_do/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

// Facade is a design pattern for connecting two or more classes with
// weird interfaces into just one simplified interface. In our case, it will connect
// FirebaseAuth and GoogleSignIn.

abstract class IAuthFacade {
  Future<void> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<void> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<void> signInWithGoogle();
}
