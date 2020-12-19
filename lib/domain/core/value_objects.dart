import 'package:dartz/dartz.dart';
import 'package:ddd_to_do/domain/core/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// The core folder has files that contains code that is common between different files
// For example, email_address will extend from this abstract class to get the operator ==, hashcode, and toString methods
@immutable
abstract class ValueObject<T> {
  const ValueObject();

  // values data type can be Either a ValueFailure or a String
  // the left side of an either is always the fail case
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueObject<T> && runtimeType == other.runtimeType && value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value {value: $value}';
  }
}
