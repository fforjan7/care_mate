import 'package:care_mate/data/providers/patient_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/enums/state_enum.dart';
import '../../../utils/app_snackbar.dart';

class PatientSearchView extends ConsumerStatefulWidget {
  const PatientSearchView({super.key});

  @override
  ConsumerState<PatientSearchView> createState() => _PatientSearchViewState();
}

class _PatientSearchViewState extends ConsumerState<PatientSearchView> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var provider = ref.watch(patientSearchProvider);
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      ref.read(patientSearchProvider.notifier).getPatients();
      print("NE RADI");
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(patientSearchProvider);

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
      body: ListView.separated(
        itemCount: provider.patients.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(provider.patients[index].name),
            subtitle: Text(provider.patients[index].surname),
            trailing: Text(provider.patients[index].date_of_birth),
          );
        },
      ),
    );
  }
}
