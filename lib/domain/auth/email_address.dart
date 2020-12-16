import 'package:flutter/foundation.dart';

class EmailAddress {
  final String value;

  factory EmailAddress(String input) {
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({
    @required this.value,
  }) : assert(value != null);

  @override
  String toString() {
    return 'EmailAddress{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmailAddress &&
          runtimeType == other.runtimeType &&
          value == other.value);

  @override
  int get hashCode => value.hashCode;

  // The validation is done in this class instead of the common Text form field
  String validateEmailAddress(String input) {
    // Maybe not the most robust way of email validation but it's good enough
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(input)) {
      // input is valid
      return input;
    } else {
      // if input is bad, throw an exception
      throw InvalidEmailException(failedValue: input);
    }
  }
}

// Create my own exception
class InvalidEmailException implements Exception {
  final String failedValue;

  InvalidEmailException({@required this.failedValue});
}
