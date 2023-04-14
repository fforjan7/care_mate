import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/enums/constants/routes.dart';
import '../../data/providers/auth/login_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan nfc"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              ref.read(loginProvider.notifier).signOut();
              GoRouter.of(context).go(AppRoutes.login);
            },
            child: const Text("Logout"),
          ),
        ),
      ),
    );
  }
}
