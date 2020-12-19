// The validation is done here instead of the common Text form field
import 'package:dartz/dartz.dart';
import 'package:ddd_to_do/domain/auth/value_objects.dart';
import 'package:ddd_to_do/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    // input is valid, email address is correct
    return right(input);
  } else {
    // if input is bad, throw an exception
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    // input is valid, email address is correct
    return right(input);
  } else {
    // if input is bad, throw an exception
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}
