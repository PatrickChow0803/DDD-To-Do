import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';

class EmailAddress {
  // values data type can be Either a ValueFailure or a String
  // the left side of an either is always the fail case
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    // since validateEMailAddress returns a string, this is allowed
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({this.value});

  @override
  String toString() {
    return 'EmailAddress{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmailAddress && runtimeType == other.runtimeType && value == other.value);

  @override
  int get hashCode => value.hashCode;
}

// The validation is done here instead of the common Text form field
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

// The different types of passwords when authenticating
// type in the terminal flutter pub run build_runner watch to generate the code from freezed
// watch keyword is so that if changes are made in my code, the generator automatically generates the changes
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}

void showTheEmailAddressOrFailure() {
  final emailAddress = EmailAddress('fafsa');

  String emailText = emailAddress.value.fold((left) => 'Failure happened, $left', (right) => right);

  // This does the same thing as using the fold method
  // Difference is that I don't get access to the left variable.
  String emailText2 = emailAddress.value.getOrElse(() => 'Some failure happened');
}
