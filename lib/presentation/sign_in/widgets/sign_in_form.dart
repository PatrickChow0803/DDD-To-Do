import 'package:ddd_to_do/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: ListView(
            children: [
              const Icon(
                Icons.sticky_note_2,
                size: 180,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefix: Icon(
                      Icons.email,
                    ),
                    labelText: "Email",
                  ),
                  autocorrect: false,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
