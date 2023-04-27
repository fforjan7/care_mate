import 'package:care_mate/data/models/patient.dart';
import 'package:care_mate/data/providers/patient_update_provider.dart';
import 'package:care_mate/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/constants/routes.dart';
import '../../../common/enums/state_enum.dart';
import '../../../utils/app_snackbar.dart';
import '../../../utils/custom_text_form_field_date_picker.dart';
import '../../widgets/custom_loading_indicator.dart';

class PatientFormView extends ConsumerStatefulWidget {
  const PatientFormView({super.key});

  @override
  ConsumerState<PatientFormView> createState() => _PatientFormViewState();
}

class _PatientFormViewState extends ConsumerState<PatientFormView> {
  final _formKey = GlobalKey<FormState>();
  late Patient patient;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final patientJson = GoRouterState.of(context).extra as Map<String, dynamic>;
    patient = Patient.fromJson(patientJson);
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) async {
      ref.read(patientUpdateProvider.notifier).setInitialPatientData(patient);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(patientUpdateProvider);
    print(provider.surname);

    ref.listen(patientUpdateProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        ref.read(patientUpdateProvider.notifier).setInitialState();
        ref.read(patientUpdateProvider.notifier).clearAllFields();
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
                    ref.read(patientUpdateProvider.notifier).setInitialState();
                  }
                });
          },
        );
      }
    });
    return provider.appState == AppState.loading
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
                        initialValue: patient.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "Surname",
                        initialValue: patient.surname,
                        onChanged: (value) {
                          ref
                              .read(patientUpdateProvider.notifier)
                              .setSurname(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormFieldDatePicker(
                        initialValueString: patient.date_of_birth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "CHANGE TO DropdownButtonFormField",
                        initialValue: patient.gender,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "City",
                        initialValue: patient.city,
                        onChanged: (value) {
                          ref
                              .read(patientUpdateProvider.notifier)
                              .setCity(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "Address",
                        initialValue: patient.address,
                        onChanged: (value) {
                          ref
                              .read(patientUpdateProvider.notifier)
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
                                .read(patientUpdateProvider.notifier)
                                .updatePatient();
                          }
                        },
                        child: const Text("Update patient"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
