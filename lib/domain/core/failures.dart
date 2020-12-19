import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

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
