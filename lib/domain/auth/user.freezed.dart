// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UniqueUserTearOff {
  const _$UniqueUserTearOff();

// ignore: unused_element
  _UniqueUser call({@required UniqueId id}) {
    return _UniqueUser(
      id: id,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UniqueUser = _$UniqueUserTearOff();

/// @nodoc
mixin _$UniqueUser {
  UniqueId get id;

  $UniqueUserCopyWith<UniqueUser> get copyWith;
}

/// @nodoc
abstract class $UniqueUserCopyWith<$Res> {
  factory $UniqueUserCopyWith(
          UniqueUser value, $Res Function(UniqueUser) then) =
      _$UniqueUserCopyWithImpl<$Res>;
  $Res call({UniqueId id});
}

/// @nodoc
class _$UniqueUserCopyWithImpl<$Res> implements $UniqueUserCopyWith<$Res> {
  _$UniqueUserCopyWithImpl(this._value, this._then);

  final UniqueUser _value;
  // ignore: unused_field
  final $Res Function(UniqueUser) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$UniqueUserCopyWith<$Res> implements $UniqueUserCopyWith<$Res> {
  factory _$UniqueUserCopyWith(
          _UniqueUser value, $Res Function(_UniqueUser) then) =
      __$UniqueUserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id});
}

/// @nodoc
class __$UniqueUserCopyWithImpl<$Res> extends _$UniqueUserCopyWithImpl<$Res>
    implements _$UniqueUserCopyWith<$Res> {
  __$UniqueUserCopyWithImpl(
      _UniqueUser _value, $Res Function(_UniqueUser) _then)
      : super(_value, (v) => _then(v as _UniqueUser));

  @override
  _UniqueUser get _value => super._value as _UniqueUser;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_UniqueUser(
      id: id == freezed ? _value.id : id as UniqueId,
    ));
  }
}

/// @nodoc
class _$_UniqueUser implements _UniqueUser {
  const _$_UniqueUser({@required this.id}) : assert(id != null);

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'UniqueUser(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UniqueUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$UniqueUserCopyWith<_UniqueUser> get copyWith =>
      __$UniqueUserCopyWithImpl<_UniqueUser>(this, _$identity);
}

abstract class _UniqueUser implements UniqueUser {
  const factory _UniqueUser({@required UniqueId id}) = _$_UniqueUser;

  @override
  UniqueId get id;
  @override
  _$UniqueUserCopyWith<_UniqueUser> get copyWith;
}
