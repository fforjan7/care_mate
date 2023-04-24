import 'package:care_mate/common/enums/constants/routes.dart';
import 'package:care_mate/data/providers/patient_get_provider.dart';
import 'package:care_mate/ui/views/home/widgets/custom_grid_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/state_enum.dart';
import '../../../utils/app_snackbar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(patientGetProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        ref.read(patientGetProvider.notifier).setInitialState();
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context, text: next.error, closedCallback: (value) {});
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patients management"),
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.settings);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomGridElement(
                  icon: Icons.nfc,
                  title: "Scan nfc",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.nfc);
                  },
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                CustomGridElement(
                  icon: Icons.add,
                  title: "Add new patient",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.patientAdd);
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomGridElement(
                  icon: Icons.people,
                  title: "Search patients",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.patientSearch);
                  },
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                CustomGridElement(
                  icon: Icons.room,
                  title: "Hospital layout",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.hospitalFLoors);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
