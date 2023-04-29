import 'package:care_mate/common/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers/login_provider.dart';

class ReusableDrawer extends ConsumerWidget {
  const ReusableDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onPressed: () {
                  ref.read(loginProvider.notifier).signOut();
                  GoRouter.of(context).go(AppRoutes.login);
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
