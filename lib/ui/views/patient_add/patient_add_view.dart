import 'package:care_mate/data/providers/patient_add_provider.dart';
import 'package:care_mate/ui/widgets/custom_text_form_field.dart';
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
  final _formKey = GlobalKey<FormState>();

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
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          labelText: "Name",
                          onChanged: (value) {
                            ref
                                .read(patientAddProvider.notifier)
                                .setName(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          labelText: "Surame",
                          onChanged: (value) {
                            ref
                                .read(patientAddProvider.notifier)
                                .setSurname(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          labelText: "CHANGE TO DATEPICKER",
                          onChanged: (value) {
                            ref
                                .read(patientAddProvider.notifier)
                                .setDateOfBirth(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          labelText: "CHANGE TO DropdownButtonFormField",
                          onChanged: (value) {
                            ref
                                .read(patientAddProvider.notifier)
                                .setGender(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          labelText: "City",
                          onChanged: (value) {
                            ref
                                .read(patientAddProvider.notifier)
                                .setCity(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          labelText: "Address",
                          onChanged: (value) {
                            ref
                                .read(patientAddProvider.notifier)
                                .setAddress(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(patientAddProvider.notifier)
                                  .patientAdd();
                            }
                          },
                          child: const Text("Add patient"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
