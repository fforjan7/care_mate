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
        ref.read(nfcProvider.notifier).setInitialState();
        if (patient != null) {
          //go to patient screen
          //GoRouter.of(context).go(AppRoutes.home);
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
              child: provider.id == ''
                  ? const Text("Searching for NFC...")
                  : bed == null
                      ? adminProvider.isAdmin
                          ? ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRoutes.hospitalFLoors);
                              },
                              child: const Text("Connect this NFC to a bed"),
                            )
                          : const Text(
                              "Contat admin to connect this NFC to a bed")
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text("Connect patient to bed"),
                        ),
            ),
    );
  }
}
