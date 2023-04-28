import 'package:care_mate/data/models/bed.dart';
import 'package:care_mate/data/models/room.dart';
import 'package:care_mate/data/models/state/beds_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums/state_enum.dart';

class BedsNotifier extends StateNotifier<BedsState> {
  BedsNotifier(this.ref) : super(const BedsState());
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

  Future<void> addBed({required Room room}) async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await ref
          .read(firestoreRepositoryProvider)
          .addBed(bed: Bed(name: state.name, roomId: room.id));
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final bedsProvider =
    StateNotifierProvider.autoDispose<BedsNotifier, BedsState>((ref) {
  return BedsNotifier(ref);
});