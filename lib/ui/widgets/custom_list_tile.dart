import 'package:care_mate/data/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({
    Key? key,
    required this.title,
    required this.route,
    this.isLogout = false,
  }) : super(key: key);

  final String title;
  final String route;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, child) {
        return InkWell(
          splashColor: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 0, bottom: 0),
            child: Row(
              children: [
                const SizedBox(width: 14),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(title),
                ),
              ],
            ),
          ),
          onTap: () {
            if (isLogout) {
              ref.read(loginProvider.notifier).signOut();
              GoRouter.of(context).go(route);
            } else {
              GoRouter.of(context).push(route);
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}
