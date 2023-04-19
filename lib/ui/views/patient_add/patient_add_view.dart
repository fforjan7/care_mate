import 'package:care_mate/data/providers/firestore/patient_add_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/constants/routes.dart';
import '../../../common/enums/state_enum.dart';
import '../../../utils/app_snackbar.dart';
import '../../widgets/custom_loading_indicator.dart';

class PatientAddView extends ConsumerStatefulWidget {
  const PatientAddView({super.key});

  @override
  ConsumerState<PatientAddView> createState() => _PatientAddViewState();
}

class _PatientAddViewState extends ConsumerState<PatientAddView> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(patientAddProvider);

    ref.listen(patientAddProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        ref.read(patientAddProvider.notifier).setInitialState();
        //ref.read(navigationProvider.notifier).state = AppRoutes.home;
        ref.read(patientAddProvider.notifier).clearAllFields();
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
                    ref.read(patientAddProvider.notifier).setInitialState();
                  }
                });
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text("Add new patient")),
      body: provider.appState == AppState.loading
          ? const CustomLoadingIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        ref.read(patientAddProvider.notifier).setName(value);
                        ref
                            .read(patientAddProvider.notifier)
                            .setAddress("Mosorska 21");
                        ref
                            .read(patientAddProvider.notifier)
                            .setDateOfBirth("25.5.1998.");
                        ref
                            .read(patientAddProvider.notifier)
                            .setSurname("Forjannn");
                        ref
                            .read(patientAddProvider.notifier)
                            .setGender("musko");
                        ref.read(patientAddProvider.notifier).setCity("Osijek");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(patientAddProvider.notifier).patientAdd();
                      },
                      child: const Text("Add patient"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
