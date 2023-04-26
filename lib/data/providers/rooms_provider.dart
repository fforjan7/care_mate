import 'package:care_mate/data/models/room.dart';
import 'package:care_mate/data/models/state/rooms_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums/state_enum.dart';
import '../models/floor.dart';

class RoomsNotifier extends StateNotifier<RoomsState> {
  RoomsNotifier(this.ref) : super(const RoomsState());
  Ref ref;

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void clearName() {
    state = state.copyWith(name: '');
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<void> addRoom({required Floor floor}) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await ref
          .read(firestoreRepositoryProvider)
          .addRoom(room: Room(name: state.name, floorId: floor.id));
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final roomsProvider =
    StateNotifierProvider.autoDispose<RoomsNotifier, RoomsState>((ref) {
  return RoomsNotifier(ref);
});
