import 'package:care_mate/data/providers/auth/login_provider.dart';
import 'package:care_mate/ui/views/login/widgets/custom_text_form_field.dart';
import 'package:care_mate/ui/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/constants/routes.dart';
import '../../../common/enums/state_enum.dart';
import '../../../data/providers/auth/navigation_provider.dart';
import '../../../utils/app_snackbar.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(loginProvider);
    ref.listen(loginProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        ref.read(loginProvider.notifier).setInitialState();
        ref.read(navigationProvider.notifier).state = AppRoutes.home;
        ref.read(loginProvider.notifier).clearEmail();
        ref.read(loginProvider.notifier).clearPassword();
        GoRouter.of(context).go(AppRoutes.home);
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context,
                text: next.error,
                closedCallback: (value) {
                  if (mounted) {
                    ref.read(loginProvider.notifier).setInitialState();
                  }
                });
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Care Mate'),
      ),
      body: provider.appState == AppState.loading
          ? const CustomLoadingIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextFormField(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextFormField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Button"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
