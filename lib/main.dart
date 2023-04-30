import 'package:care_mate/ui/views/hospital_layout/beds_view.dart';
import 'package:care_mate/ui/views/hospital_layout/floors_view.dart';
import 'package:care_mate/ui/views/hospital_layout/rooms_view.dart';
import 'package:care_mate/ui/views/patient/patient_tabs_view.dart';
import 'package:care_mate/ui/views/nfc/nfc_view.dart';
import 'package:care_mate/ui/views/home/home_view.dart';
import 'package:care_mate/ui/views/login/login_view.dart';
import 'package:care_mate/ui/views/patient_add/patient_add_view.dart';
import 'package:care_mate/ui/views/patient_search/patient_search_view.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'common/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Care Mate',
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
        path: AppRoutes.nfc,
        builder: (BuildContext context, GoRouterState state) {
          return const NfcView();
        },
      ),
      GoRoute(
        path: AppRoutes.patientAdd,
        builder: (BuildContext context, GoRouterState state) {
          return const PatientAddView();
        },
      ),
      GoRoute(
        path: AppRoutes.patientSearch,
        builder: (BuildContext context, GoRouterState state) {
          return const PatientSearchView();
        },
      ),
      GoRoute(
        path: AppRoutes.hospitalFLoors,
        builder: (BuildContext context, GoRouterState state) {
          return const HospitalFloorsView();
        },
      ),
      GoRoute(
        path: AppRoutes.hospitalRooms,
        builder: (BuildContext context, GoRouterState state) {
          return const HospitalRoomsView();
        },
      ),
      GoRoute(
        path: AppRoutes.hospitalBeds,
        builder: (BuildContext context, GoRouterState state) {
          return const HospitalBedsView();
        },
      ),
      GoRoute(
        path: AppRoutes.patientTabs,
        builder: (BuildContext context, GoRouterState state) {
          return const PatientTabsView();
        },
      ),
    ],
  );
}
