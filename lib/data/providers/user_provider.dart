import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/user_state.dart';
import 'package:care_mate/data/providers/repositories/auth_repository_provider.dart';
import 'package:care_mate/data/providers/repositories/firestore_repository_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this.ref) : super(const UserState());
  final Ref ref;

  Future<void> checkAdminRights() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      User? user = ref.read(authRepositoryProvider).getCurrentUser();
      state = state.copyWith(
          isAdmin: await ref
              .read(firestoreRepositoryProvider)
              .checkAdminRights(user: user));
    } catch (e) {
      print(e.toString());
      state = state.copyWith(appState: AppState.error, error: e.toString());
    }
    state = state.copyWith(appState: AppState.success);
    return;
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref);
});
