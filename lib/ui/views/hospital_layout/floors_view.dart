import 'package:care_mate/data/models/floor.dart';
import 'package:care_mate/data/providers/floors_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/repositories/firestore_repository_provider.dart';
import '../../widgets/custom_Popup.dart';
import '../../widgets/custom_loading_indicator.dart';

class HospitalFloorsView extends ConsumerStatefulWidget {
  const HospitalFloorsView({super.key});

  @override
  ConsumerState<HospitalFloorsView> createState() => _HospitalFloorsViewState();
}

class _HospitalFloorsViewState extends ConsumerState<HospitalFloorsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hospital Floors"), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: CustomPopupForm(
                      title1: "Floor name",
                      onChanged1: (value) {
                        ref.read(floorsProvider.notifier).setName(value);
                      },
                      onPressed: () async =>
                          await ref.read(floorsProvider.notifier).addFloor()),
                );
              },
            );
          },
        ),
      ]),
      body: StreamBuilder(
        stream: ref.read(firestoreRepositoryProvider).streamFloors(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Floor> floors = snapshot.data!;
            return floors.isEmpty
                ? const CustomLoadingIndicator()
                : ListView.separated(
                    itemCount: floors.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(floors[index].name),
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
