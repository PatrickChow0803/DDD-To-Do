// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

// ignore: unused_element
  EmailChanged emailChanged(String emailString) {
    return EmailChanged(
      emailString,
    );
  }

// ignore: unused_element
  PasswordChanged passwordChanged(String passwordString) {
    return PasswordChanged(
      passwordString,
    );
  }

// ignore: unused_element
  RegisterWithEmailAndPasswordPressed registerWithEmailAndPasswordPressed() {
    return const RegisterWithEmailAndPasswordPressed();
  }

// ignore: unused_element
  SignInWithEmailAndPasswordPressed signInWithEmailAndPasswordPressed() {
    return const SignInWithEmailAndPasswordPressed();
  }

// ignore: unused_element
  SignInWithGooglePressed signInWithGooglePressed(String passwordString) {
    return SignInWithGooglePressed(
      passwordString,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SignInFormEvent = _$SignInFormEventTearOff();

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPressed(),
    @required TResult signInWithEmailAndPasswordPressed(),
    @required TResult signInWithGooglePressed(String passwordString),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPressed(),
    TResult signInWithEmailAndPasswordPressed(),
    TResult signInWithGooglePressed(String passwordString),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPressed value),
    @required
        TResult signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPressed value),
    @required TResult signInWithGooglePressed(SignInWithGooglePressed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPressed value),
    TResult signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPressed value),
    TResult signInWithGooglePressed(SignInWithGooglePressed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  final SignInFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignInFormEvent) _then;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailString});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object emailString = freezed,
  }) {
    return _then(EmailChanged(
      emailString == freezed ? _value.emailString : emailString as String,
    ));
  }
}

/// @nodoc
class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailString) : assert(emailString != null);

  @override
  final String emailString;

  @override
  String toString() {
    return 'SignInFormEvent.emailChanged(emailString: $emailString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.emailString, emailString) ||
                const DeepCollectionEquality()
                    .equals(other.emailString, emailString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(emailString);

  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPressed(),
    @required TResult signInWithEmailAndPasswordPressed(),
    @required TResult signInWithGooglePressed(String passwordString),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return emailChanged(emailString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPressed(),
    TResult signInWithEmailAndPasswordPressed(),
    TResult signInWithGooglePressed(String passwordString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(emailString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPressed value),
    @required
        TResult signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPressed value),
    @required TResult signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPressed value),
    TResult signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPressed value),
    TResult signInWithGooglePressed(SignInWithGooglePressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignInFormEvent {
  const factory EmailChanged(String emailString) = _$EmailChanged;

  String get emailString;
  $EmailChangedCopyWith<EmailChanged> get copyWith;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordString});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object passwordString = freezed,
  }) {
    return _then(PasswordChanged(
      passwordString == freezed
          ? _value.passwordString
          : passwordString as String,
    ));
  }
}

/// @nodoc
class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.passwordString) : assert(passwordString != null);

  @override
  final String passwordString;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChanged(passwordString: $passwordString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.passwordString, passwordString) ||
                const DeepCollectionEquality()
                    .equals(other.passwordString, passwordString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(passwordString);

  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPressed(),
    @required TResult signInWithEmailAndPasswordPressed(),
    @required TResult signInWithGooglePressed(String passwordString),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return passwordChanged(passwordString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPressed(),
    TResult signInWithEmailAndPasswordPressed(),
    TResult signInWithGooglePressed(String passwordString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(passwordString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPressed value),
    @required
        TResult signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPressed value),
    @required TResult signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPressed value),
    TResult signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPressed value),
    TResult signInWithGooglePressed(SignInWithGooglePressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInFormEvent {
  const factory PasswordChanged(String passwordString) = _$PasswordChanged;

  String get passwordString;
  $PasswordChangedCopyWith<PasswordChanged> get copyWith;
}

/// @nodoc
abstract class $RegisterWithEmailAndPasswordPressedCopyWith<$Res> {
  factory $RegisterWithEmailAndPasswordPressedCopyWith(
          RegisterWithEmailAndPasswordPressed value,
          $Res Function(RegisterWithEmailAndPasswordPressed) then) =
      _$RegisterWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $RegisterWithEmailAndPasswordPressedCopyWith<$Res> {
  _$RegisterWithEmailAndPasswordPressedCopyWithImpl(
      RegisterWithEmailAndPasswordPressed _value,
      $Res Function(RegisterWithEmailAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as RegisterWithEmailAndPasswordPressed));

  @override
  RegisterWithEmailAndPasswordPressed get _value =>
      super._value as RegisterWithEmailAndPasswordPressed;
}

/// @nodoc
class _$RegisterWithEmailAndPasswordPressed
    implements RegisterWithEmailAndPasswordPressed {
  const _$RegisterWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'SignInFormEvent.registerWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPressed(),
    @required TResult signInWithEmailAndPasswordPressed(),
    @required TResult signInWithGooglePressed(String passwordString),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return registerWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPressed(),
    TResult signInWithEmailAndPasswordPressed(),
    TResult signInWithGooglePressed(String passwordString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPressed value),
    @required
        TResult signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPressed value),
    @required TResult signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return registerWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPressed value),
    TResult signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPressed value),
    TResult signInWithGooglePressed(SignInWithGooglePressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPasswordPressed != null) {
      return registerWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithEmailAndPasswordPressed implements SignInFormEvent {
  const factory RegisterWithEmailAndPasswordPressed() =
      _$RegisterWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class $SignInWithEmailAndPasswordPressedCopyWith<$Res> {
  factory $SignInWithEmailAndPasswordPressedCopyWith(
          SignInWithEmailAndPasswordPressed value,
          $Res Function(SignInWithEmailAndPasswordPressed) then) =
      _$SignInWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithEmailAndPasswordPressedCopyWith<$Res> {
  _$SignInWithEmailAndPasswordPressedCopyWithImpl(
      SignInWithEmailAndPasswordPressed _value,
      $Res Function(SignInWithEmailAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as SignInWithEmailAndPasswordPressed));

  @override
  SignInWithEmailAndPasswordPressed get _value =>
      super._value as SignInWithEmailAndPasswordPressed;
}

/// @nodoc
class _$SignInWithEmailAndPasswordPressed
    implements SignInWithEmailAndPasswordPressed {
  const _$SignInWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPressed(),
    @required TResult signInWithEmailAndPasswordPressed(),
    @required TResult signInWithGooglePressed(String passwordString),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPressed(),
    TResult signInWithEmailAndPasswordPressed(),
    TResult signInWithGooglePressed(String passwordString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPressed value),
    @required
        TResult signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPressed value),
    @required TResult signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPressed value),
    TResult signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPressed value),
    TResult signInWithGooglePressed(SignInWithGooglePressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signInWithEmailAndPasswordPressed != null) {
      return signInWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithEmailAndPasswordPressed implements SignInFormEvent {
  const factory SignInWithEmailAndPasswordPressed() =
      _$SignInWithEmailAndPasswordPressed;
}

/// @nodoc
abstract class $SignInWithGooglePressedCopyWith<$Res> {
  factory $SignInWithGooglePressedCopyWith(SignInWithGooglePressed value,
          $Res Function(SignInWithGooglePressed) then) =
      _$SignInWithGooglePressedCopyWithImpl<$Res>;
  $Res call({String passwordString});
}

/// @nodoc
class _$SignInWithGooglePressedCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res>
    implements $SignInWithGooglePressedCopyWith<$Res> {
  _$SignInWithGooglePressedCopyWithImpl(SignInWithGooglePressed _value,
      $Res Function(SignInWithGooglePressed) _then)
      : super(_value, (v) => _then(v as SignInWithGooglePressed));

  @override
  SignInWithGooglePressed get _value => super._value as SignInWithGooglePressed;

  @override
  $Res call({
    Object passwordString = freezed,
  }) {
    return _then(SignInWithGooglePressed(
      passwordString == freezed
          ? _value.passwordString
          : passwordString as String,
    ));
  }
}

/// @nodoc
class _$SignInWithGooglePressed implements SignInWithGooglePressed {
  const _$SignInWithGooglePressed(this.passwordString)
      : assert(passwordString != null);

  @override
  final String passwordString;

  @override
  String toString() {
    return 'SignInFormEvent.signInWithGooglePressed(passwordString: $passwordString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInWithGooglePressed &&
            (identical(other.passwordString, passwordString) ||
                const DeepCollectionEquality()
                    .equals(other.passwordString, passwordString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(passwordString);

  @override
  $SignInWithGooglePressedCopyWith<SignInWithGooglePressed> get copyWith =>
      _$SignInWithGooglePressedCopyWithImpl<SignInWithGooglePressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emailChanged(String emailString),
    @required TResult passwordChanged(String passwordString),
    @required TResult registerWithEmailAndPasswordPressed(),
    @required TResult signInWithEmailAndPasswordPressed(),
    @required TResult signInWithGooglePressed(String passwordString),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithGooglePressed(passwordString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emailChanged(String emailString),
    TResult passwordChanged(String passwordString),
    TResult registerWithEmailAndPasswordPressed(),
    TResult signInWithEmailAndPasswordPressed(),
    TResult signInWithGooglePressed(String passwordString),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed(passwordString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emailChanged(EmailChanged value),
    @required TResult passwordChanged(PasswordChanged value),
    @required
        TResult registerWithEmailAndPasswordPressed(
            RegisterWithEmailAndPasswordPressed value),
    @required
        TResult signInWithEmailAndPasswordPressed(
            SignInWithEmailAndPasswordPressed value),
    @required TResult signInWithGooglePressed(SignInWithGooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPasswordPressed != null);
    assert(signInWithEmailAndPasswordPressed != null);
    assert(signInWithGooglePressed != null);
    return signInWithGooglePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emailChanged(EmailChanged value),
    TResult passwordChanged(PasswordChanged value),
    TResult registerWithEmailAndPasswordPressed(
        RegisterWithEmailAndPasswordPressed value),
    TResult signInWithEmailAndPasswordPressed(
        SignInWithEmailAndPasswordPressed value),
    TResult signInWithGooglePressed(SignInWithGooglePressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signInWithGooglePressed != null) {
      return signInWithGooglePressed(this);
    }
    return orElse();
  }
}

abstract class SignInWithGooglePressed implements SignInFormEvent {
  const factory SignInWithGooglePressed(String passwordString) =
      _$SignInWithGooglePressed;

  String get passwordString;
  $SignInWithGooglePressedCopyWith<SignInWithGooglePressed> get copyWith;
}
