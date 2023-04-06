import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/login_state.dart';
import 'package:care_mate/data/providers/auth/auth_repository_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(super._state, this.ref);
  final Ref ref;

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void clearEmail() {
    state = state.copyWith(email: '');
  }

  void clearPassword() {
    state = state.copyWith(password: '');
  }

  void setInitialState() {
    state = state.copyWith(error: '', appState: AppState.initial);
  }

  Future<String?> signInWithEmailAndPassword() async {
    state = state.copyWith(appState: AppState.loading);
    try {
      print(state.email);
      print(state.password);
      String? res =
          await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
                email: state.email,
                password: state.password,
              );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(appState: AppState.error, error: e.message!);
    }

    state = state.copyWith(appState: AppState.success);
    return null;
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(const LoginState(), ref);
});
