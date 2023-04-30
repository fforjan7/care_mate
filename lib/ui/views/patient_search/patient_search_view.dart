import 'package:care_mate/common/constants/routes.dart';
import 'package:care_mate/data/models/patient.dart';
import 'package:care_mate/data/providers/initial_patient_provider.dart';
import 'package:care_mate/data/providers/nfc_provider.dart';
import 'package:care_mate/data/providers/patient_search_provider.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:care_mate/data/providers/tabs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/state_enum.dart';
import '../../../utils/app_snackbar.dart';
import '../../widgets/custom_loading_indicator.dart';

class PatientSearchView extends ConsumerStatefulWidget {
  const PatientSearchView({super.key});

  @override
  ConsumerState<PatientSearchView> createState() => _PatientSearchViewState();
}

class _PatientSearchViewState extends ConsumerState<PatientSearchView> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var searchProvider = ref.watch(patientSearchProvider);
    var selectedBed = ref.read(nfcProvider).bed;

    ref.listen(patientSearchProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        showAppSnackBar(
            context: context,
            text: "Patient successfully added to bed",
            closedCallback: (value) {
              if (mounted) {
                ref.read(patientSearchProvider.notifier).setInitialState();
              }
            });
        ref.read(patientSearchProvider.notifier).setInitialState();
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        showAppSnackBar(
            context: context,
            text: next.error,
            closedCallback: (value) {
              if (mounted) {
                ref.read(patientSearchProvider.notifier).setInitialState();
              }
            });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          focusNode: _focusNode,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            labelText: "Search patients",
            labelStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            ref.read(patientSearchProvider.notifier).setSearchInput(value);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                _focusNode.requestFocus();
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: ref.read(firestoreRepositoryProvider).streamPatients(
              searchInput: searchProvider.searchInput,
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Patient> patients =
                snapshot.data == null ? [] : snapshot.data!;
            final List<Patient> filteredPatients = ref
                .read(patientSearchProvider.notifier)
                .filterPatients(patients: patients);
            return filteredPatients.isEmpty
                ? const CustomLoadingIndicator()
                : ListView.separated(
                    itemCount: filteredPatients.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          "${filteredPatients[index].surname} ${filteredPatients[index].name}",
                        ),
                        subtitle: Text(
                          filteredPatients[index].date_of_birth,
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              filteredPatients[index].city,
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              filteredPatients[index].address,
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          //initialize patient data
                          ref
                              .read(tabsProvider.notifier)
                              .setInitialPatientData(filteredPatients[index]);
                          ref.read(initialPatientProvider.notifier).state =
                              filteredPatients[index];
                          if (selectedBed.id != '') {
                            ref
                                .read(patientSearchProvider.notifier)
                                .connectPatientToBed(
                                    bed: selectedBed,
                                    patient: filteredPatients[index]);
                            while (context.canPop()) {
                              context.pop();
                            }
                            GoRouter.of(context).push(AppRoutes.patientTabs);
                          } else {
                            GoRouter.of(context).push(AppRoutes.patientTabs);
                          }
                        },
                      );
                    },
                  );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
