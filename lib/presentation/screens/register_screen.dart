import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              _RegisterForm(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: registerCubit.usernameChanged,
            errorText: username.errorMessage
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Email',
            onChanged: registerCubit.emailChanged,
            errorText: email.errorMessage
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorText: password.errorMessage
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
              icon: const Icon(Icons.save_outlined),
              onPressed: () {
                registerCubit.onSubmit();
              },
              label: const Text('Create user')),
        ],
      ),
    );
  }
}
