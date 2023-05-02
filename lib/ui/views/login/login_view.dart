import 'dart:async';

import 'package:care_mate/data/providers/login_provider.dart';
import 'package:care_mate/ui/views/login/widgets/auth_form_field.dart';
import 'package:care_mate/ui/widgets/custom_loading_indicator.dart';
import 'package:care_mate/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/routes.dart';
import '../../../common/enums/state_enum.dart';

import '../../../utils/app_snackbar.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    User? user = ref.read(loginProvider.notifier).getCurrentUser();
    if (user != null) {
      Timer(Duration.zero, () {
        GoRouter.of(context).go(AppRoutes.home);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(loginProvider);

    ref.listen(loginProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        GoRouter.of(context).go(AppRoutes.home);
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        showAppSnackBar(
            context: context,
            text: next.error,
            closedCallback: (value) {
              if (mounted) {
                ref.read(loginProvider.notifier).setInitialState();
              }
            });
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Care Mate'),
      ),
      body: provider.appState == AppState.loading
          ? const CustomLoadingIndicator()
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Text(
                          "Welcome to Care mate",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20,
                        ),
                        child: AuthFormField(
                          labelText: "Email",
                          onChanged: (value) {
                            ref.read(loginProvider.notifier).setEmail(value);
                          },
                          inputType: InputType.email,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20,
                        ),
                        child: AuthFormField(
                          labelText: "Password",
                          onChanged: (value) {
                            ref.read(loginProvider.notifier).setPassword(value);
                          },
                          inputType: InputType.password,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(loginProvider.notifier)
                                  .signInWithEmailAndPassword();
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
