part of 'sign_in_form_bloc.dart';

// Think of the possible states (UI/ Variables) for auth
// modify the UI
// comes out from the block
@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState(
      {@required EmailAddress emailAddress,
      @required Password password,
      @required bool showErrorMessages,
      // used to determine if to display loading ui or not
      @required bool isSubmitting,
      @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}
