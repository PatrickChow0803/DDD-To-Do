import 'package:ddd_to_do/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        // this is for displaying a snackbar when signing in with Google
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server Error',
                  emailAlreadyInUse: (_) => "Email Already In Use",
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination'),
              // shows the snackbar
            ).show(context);
          },
              // navigate
              (_) => null),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode:
              state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: ListView(
            children: [
              const Icon(
                Icons.sticky_note_2,
                size: 180,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelText: "Email",
                  ),
                  autocorrect: false,
                  onChanged: (value) {
                    // the value will be validated inside of the value object
                    context.read<SignInFormBloc>().add(SignInFormEvent.emailChanged(value));
                  },
                  validator: (_) => context.read<SignInFormBloc>().state.emailAddress.value.fold(
                      (f) => f.maybeMap(
                            invalidEmail: (_) => "Invalid Email",
                            orElse: () => null,
                          ),
                      (_) => null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    labelText: "Password",
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) {
                    // the value will be validated inside of the value object
                    context.read<SignInFormBloc>().add(SignInFormEvent.passwordChanged(value));
                  },
                  validator: (_) => context.read<SignInFormBloc>().state.password.value.fold(
                      (f) => f.maybeMap(
                            shortPassword: (_) => "Invalid password",
                            orElse: () => null,
                          ),
                      (_) => null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          context
                              .read<SignInFormBloc>()
                              .add(const SignInFormEvent.signInWithEmailAndPasswordPressed());
                        },
                        child: const Text('Sign In'),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          context
                              .read<SignInFormBloc>()
                              .add(const SignInFormEvent.registerWithEmailAndPasswordPressed());
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  context
                      .read<SignInFormBloc>()
                      .add(const SignInFormEvent.signInWithGooglePressed());
                },
                color: Colors.grey,
                child: const Text(
                  'Sign In With Google',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
