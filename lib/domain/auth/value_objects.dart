import 'package:dartz/dartz.dart';
import 'package:ddd_to_do/domain/core/failures.dart';
import 'package:ddd_to_do/domain/core/value_objects.dart';
import 'package:ddd_to_do/domain/core/value_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class EmailAddress extends ValueObject<String> {
  // values data type can be Either a ValueFailure or a String
  // the left side of an either is always the fail case
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    // since validateEMailAddress returns a string, this is allowed
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({this.value});
}
