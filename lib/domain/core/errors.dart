// THESES ARE NOT FAILURES!!!
// These are things that are thrown to crash the app

import 'package:ddd_to_do/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueError;

  UnexpectedValueError(this.valueError);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueError');
  }
}
