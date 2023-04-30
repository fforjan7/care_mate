import 'package:care_mate/data/providers/nfc_provider.dart';
import 'package:care_mate/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/routes.dart';
import '../../../common/enums/state_enum.dart';
import '../../../data/models/bed.dart';
import '../../../data/models/patient.dart';
import '../../../data/providers/initial_patient_provider.dart';
import '../../../data/providers/tabs_provider.dart';
import '../../../utils/app_snackbar.dart';
import '../../widgets/custom_loading_indicator.dart';

class NfcView extends ConsumerStatefulWidget {
  const NfcView({super.key});

  @override
  ConsumerState<NfcView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends ConsumerState<NfcView> {
  Bed? bed;
  Patient? patient;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPatient();
  }

  Future<void> _getNFCTag() async {
    try {
      NFCTag tag = await FlutterNfcKit.poll(androidPlatformSound: true);
      ref.read(nfcProvider.notifier).setId(tag.id);
      await FlutterNfcKit.finish();
    } catch (e) {}
  }

  Future<void> _getBed() async {
    await _getNFCTag();
    bed = await ref.read(nfcProvider.notifier).getBedByNfcId();
    ref.read(nfcProvider.notifier).setInitialState();
  }

  Future<void> _getPatient() async {
    await _getBed();

    if (bed != null) {
      patient = await ref.read(nfcProvider.notifier).getPatientByBed(bed: bed!);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(nfcProvider);
    var adminProvider = ref.watch(userProvider);

    ref.listen(nfcProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        if (next.patient != const Patient()) {
          ref.read(tabsProvider.notifier).setInitialPatientData(next.patient);
          ref.read(initialPatientProvider.notifier).state = next.patient;

          ref.read(nfcProvider.notifier).setInitialState();
          GoRouter.of(context).pushReplacement(AppRoutes.patientTabs);
        }
      } else if (next.appState == AppState.error &&
          previous?.appState == AppState.loading) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context,
                text: next.error,
                closedCallback: (value) {
                  if (mounted) {
                    ref.read(nfcProvider.notifier).setInitialState();
                  }
                });
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan NFC'),
      ),
      body: provider.appState == AppState.loading
          ? const CustomLoadingIndicator()
          : Center(
              child: provider.nfcId == ''
                  ? const Text("Searching for NFC...")
                  : bed == null
                      ? adminProvider.isAdmin
                          ? const AdminConnectNfcToBedView()
                          : const Text(
                              "Contat admin to connect this NFC to a bed")
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("This bed is empty"),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRoutes.patientSearch);
                              },
                              child: const Text("Add patient to this bed"),
                            ),
                          ],
                        ),
            ),
    );
  }
}

class AdminConnectNfcToBedView extends StatelessWidget {
  const AdminConnectNfcToBedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This NFC is empty"),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.hospitalFLoors);
          },
          child: const Text("Connect this NFC to a bed"),
        ),
      ],
    );
  }
}
