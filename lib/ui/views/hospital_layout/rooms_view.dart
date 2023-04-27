import 'package:care_mate/data/models/floor.dart';
import 'package:care_mate/data/models/room.dart';
import 'package:care_mate/data/providers/rooms_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/constants/routes.dart';
import '../../../data/providers/repositories/firestore_repository_provider.dart';
import '../../../data/providers/user_provider.dart';
import '../../widgets/custom_Popup.dart';
import '../../widgets/custom_loading_indicator.dart';

class HospitalRoomsView extends ConsumerStatefulWidget {
  const HospitalRoomsView({super.key});

  @override
  ConsumerState<HospitalRoomsView> createState() => _HospitalRoomsViewState();
}

class _HospitalRoomsViewState extends ConsumerState<HospitalRoomsView> {
  @override
  Widget build(BuildContext context) {
    var isAdmin = ref.read(userProvider).isAdmin;
    var provider = ref.watch(roomsProvider);
    final floorJson = GoRouterState.of(context).extra as Map<String, dynamic>;
    final floor = Floor.fromJson(floorJson);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospital Rooms"),
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
                          title1: "Room name",
                          onChanged1: (value) {
                            ref.read(roomsProvider.notifier).setName(value);
                          },
                          onPressed: () async => await ref
                              .read(roomsProvider.notifier)
                              .addRoom(floor: floor),
                        ));
                      },
                    );
                  },
                )
              : const SizedBox(),
        ],
      ),
      body: StreamBuilder(
        stream: ref.read(firestoreRepositoryProvider).streamRooms(floor: floor),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Room> rooms = snapshot.data!;
            return rooms.isEmpty
                ? const Center(
                    child: Text("There are no current rooms on this floor"))
                : ListView.separated(
                    itemCount: rooms.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRoutes.hospitalBeds,
                            extra: rooms[index].toJson(),
                          );
                        },
                        child: ListTile(
                          title: Text(rooms[index].name),
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
