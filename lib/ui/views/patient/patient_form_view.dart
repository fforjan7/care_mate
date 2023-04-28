import 'package:care_mate/data/providers/tabs_provider.dart';
import 'package:care_mate/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/enums/state_enum.dart';
import '../../../data/providers/initial_patient_provider.dart';
import '../../../utils/app_snackbar.dart';
import '../../widgets/custom_text_form_field_date_picker.dart';
import '../../widgets/custom_loading_indicator.dart';

class PatientFormView extends ConsumerStatefulWidget {
  const PatientFormView({super.key});

  @override
  ConsumerState<PatientFormView> createState() => _PatientFormViewState();
}

class _PatientFormViewState extends ConsumerState<PatientFormView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(tabsProvider);
    var initialPatientData = ref.read(initialPatientProvider);
    var isPatientsDataChanged = ref
        .read(tabsProvider.notifier)
        .isPatientDataChanged(patient: initialPatientData);

    ref.listen(tabsProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        ref.read(tabsProvider.notifier).setInitialState();

        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context,
                text: "Patient successfully updated",
                closedCallback: (value) {
                  if (mounted) {
                    ref.read(tabsProvider.notifier).setInitialState();
                  }
                });
          },
        );
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context,
                text: next.error,
                closedCallback: (value) {
                  if (mounted) {
                    ref.read(tabsProvider.notifier).setInitialState();
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
                        initialValue: provider.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "Surname",
                        initialValue: provider.surname,
                        onChanged: (value) {
                          ref.read(tabsProvider.notifier).setSurname(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormFieldDatePicker(
                        lableText: "Date of birth",
                        initialValueString: provider.dateOfBirth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "CHANGE TO DropdownButtonFormField",
                        initialValue: provider.gender,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "City",
                        initialValue: provider.city,
                        onChanged: (value) {
                          ref.read(tabsProvider.notifier).setCity(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTextFormField(
                        labelText: "Address",
                        initialValue: provider.address,
                        onChanged: (value) {
                          ref.read(tabsProvider.notifier).setAddress(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: !isPatientsDataChanged
                                ? Colors.grey[400]
                                : Colors.blue),
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              isPatientsDataChanged) {
                            ref.read(tabsProvider.notifier).updatePatientData();
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
