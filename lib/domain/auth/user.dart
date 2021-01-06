// user is an Entity. NOT a value object.
// Value objects are validated constantly
// Whereas Entity can be comprised of multiple value objects
import 'package:ddd_to_do/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UniqueUser with _$UniqueUser {
  const factory UniqueUser({
    @required UniqueId id,
  }) = _UniqueUser;
}
