import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/floors_state.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

import '../models/floor.dart';

class FloorsNotifier extends StateNotifier<FloorsState> {
  FloorsNotifier(this.ref) : super(const FloorsState());
  final Ref ref;

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void clearName() {
    state = state.copyWith(name: '');
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<void> addFloor() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      await ref
          .read(firestoreRepositoryProvider)
          .addFloor(floor: Floor(name: state.name));
    } catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }
}

final floorsProvider =
    StateNotifierProvider<FloorsNotifier, FloorsState>((ref) {
  return FloorsNotifier(ref);
});
