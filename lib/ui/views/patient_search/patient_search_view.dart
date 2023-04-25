import 'package:care_mate/data/models/patient.dart';
import 'package:care_mate/data/providers/patient_search_provider.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/enums/state_enum.dart';
import '../../../utils/app_snackbar.dart';
import '../../widgets/custom_loading_indicator.dart';

class PatientSearchView extends ConsumerStatefulWidget {
  const PatientSearchView({super.key});

  @override
  ConsumerState<PatientSearchView> createState() => _PatientSearchViewState();
}

class _PatientSearchViewState extends ConsumerState<PatientSearchView> {
  @override
  @override
  Widget build(BuildContext context) {
    var searchProvider = ref.watch(patientSearchProvider);

    ref.listen(patientSearchProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        ref.read(patientSearchProvider.notifier).setInitialState();
        ref.read(patientSearchProvider.notifier).clearSearchInput();
        //GoRouter.of(context).go(AppRoutes.home);
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context,
                text: next.error,
                closedCallback: (value) {
                  if (mounted) {
                    ref.read(patientSearchProvider.notifier).setInitialState();
                  }
                });
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Search patient")),
      body: StreamBuilder(
        stream: ref.read(firestoreRepositoryProvider).streamPatients(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Patient> patients =
                snapshot.data == null ? [] : snapshot.data!;
            return patients.isEmpty
                ? const CustomLoadingIndicator()
                : ListView.separated(
                    itemCount: patients.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            "${patients[index].surname} ${patients[index].name}"),
                        subtitle: Text(patients[index].date_of_birth),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              patients[index].city,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              patients[index].address,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
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
