import 'package:care_mate/data/models/bed.dart';
import 'package:care_mate/data/providers/beds_provider.dart';
import 'package:care_mate/data/providers/nfc_provider.dart';
import 'package:care_mate/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/routes.dart';
import '../../../common/enums/state_enum.dart';
import '../../../data/models/room.dart';
import '../../../data/providers/repositories/firestore_repository_provider.dart';
import '../../../utils/app_snackbar.dart';
import '../../widgets/custom_Popup.dart';
import '../../widgets/custom_loading_indicator.dart';

class HospitalBedsView extends ConsumerStatefulWidget {
  const HospitalBedsView({super.key});

  @override
  ConsumerState<HospitalBedsView> createState() => _HospitalBedsViewState();
}

class _HospitalBedsViewState extends ConsumerState<HospitalBedsView> {
  @override
  Widget build(BuildContext context) {
    var isAdmin = ref.read(userProvider).isAdmin;
    var provider = ref.watch(bedsProvider);
    var nfcId = ref.read(nfcProvider).nfcId;

    final roomJson = GoRouterState.of(context).extra as Map<String, dynamic>;
    final room = Room.fromJson(roomJson);

    ref.listen(bedsProvider, (previous, next) {
      if (next.appState == AppState.success &&
          previous?.appState == AppState.loading) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            showAppSnackBar(
                context: context,
                text: "NFC and bed successfully connected",
                closedCallback: (value) {
                  if (mounted) {
                    ref.read(bedsProvider.notifier).setInitialState();
                  }
                });
          },
        );
        ref.read(bedsProvider.notifier).setInitialState();
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
                    ref.read(bedsProvider.notifier).setInitialState();
                  }
                });
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Beds"),
        actions: [
          isAdmin
              ? IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            content: CustomPopupForm(
                          popupTitle: "Enter bed details",
                          title1: "Bed name",
                          onChanged1: (value) {
                            ref.read(bedsProvider.notifier).setName(value);
                          },
                          onPressed: () async => await ref
                              .read(bedsProvider.notifier)
                              .addBed(room: room),
                        ));
                      },
                    );
                  },
                )
              : const SizedBox(),
        ],
      ),
      body: StreamBuilder(
        stream: ref.read(firestoreRepositoryProvider).streamBeds(room: room),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Bed> beds = snapshot.data!;
            return beds.isEmpty
                ? const Center(
                    child: Text("There are no current beds in this room"),
                  )
                : ListView.separated(
                    itemCount: beds.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        enabled: nfcId == ''
                            ? true
                            : beds[index].nfcId == ''
                                ? true
                                : false,
                        title: Text(beds[index].name),
                        onTap: () {
                          if (nfcId != '') {
                            ref.read(bedsProvider.notifier).connectNfcToBed(
                                  bed: beds[index],
                                  nfcId: nfcId,
                                );
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
