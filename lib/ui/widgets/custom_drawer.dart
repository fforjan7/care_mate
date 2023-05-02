import 'package:care_mate/common/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/enums/state_enum.dart';
import '../../data/providers/login_provider.dart';
import '../../utils/app_snackbar.dart';

class ReusableDrawer extends ConsumerWidget {
  const ReusableDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        GoRouter.of(context).go(AppRoutes.login);
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        showAppSnackBar(
            context: context,
            text: next.error,
            closedCallback: (value) {
              ref.read(loginProvider.notifier).setInitialState();
            });
      }
    });
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await ref.read(loginProvider.notifier).signOut();
                },
                child: const Text("Logout"),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
