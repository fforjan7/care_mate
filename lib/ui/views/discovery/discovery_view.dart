import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/constants/routes.dart';
import '../../../data/providers/auth/login_provider.dart';

class DiscoveryView extends ConsumerStatefulWidget {
  const DiscoveryView({super.key});

  @override
  ConsumerState<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends ConsumerState<DiscoveryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
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
