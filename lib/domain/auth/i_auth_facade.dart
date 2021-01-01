import 'package:dartz/dartz.dart';
import 'package:ddd_to_do/domain/auth/auth_failure.dart';
import 'package:ddd_to_do/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

// Facade is a design pattern for connecting two or more classes with
// weird interfaces into just one simplified interface. In our case, it will connect
// FirebaseAuth and GoogleSignIn.
// This file is inside the domain folder because remember that domain is completely independent of other layers,
// therefore this interface file should be here. This interface MUST be fulfilled, whether it's from Firebase or RestApi
// This interface allows us to implement the application logic without any FirebaseAuth dependencies!!!
abstract class IAuthFacade {
  // Use Unit here instead of void. This is because Unit is an actual class
  // whereas void is just a keyword !!!
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
