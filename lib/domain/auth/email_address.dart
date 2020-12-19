import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';

class EmailAddress {
  final String value;
  final Either<Left, Right> failure;

  factory EmailAddress(String input) {
    assert(input != null);
    // since validateEMailAddress returns a string, this is allowed
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({this.value, this.failure});

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
String validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    // input is valid
    return input;
  } else {
    // if input is bad, throw an exception
    throw InvalidEmailException(failedValue: input);
  }
}

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
}
