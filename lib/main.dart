import 'package:care_mate/ui/views/discovery/discovery_view.dart';
import 'package:care_mate/ui/views/home/home_view.dart';
import 'package:care_mate/ui/views/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'common/enums/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: AppRoutes.discovery,
        builder: (BuildContext context, GoRouterState state) {
          return const DiscoveryView();
        },
      ),
    ],
  );
}
