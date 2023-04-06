import 'package:care_mate/common/enums/state_enum.dart';
import 'package:care_mate/data/models/state/login_state.dart';
import 'package:care_mate/data/providers/auth/auth_repository_provider.dart';
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

  Future<void> login() async {
    state = state.copyWith(appState: AppState.loading);
    print(state.email);
    print(state.password);
    await ref
        .read(authRepositoryProvider)
        .signInWithEmailAndPassword(state.email, state.password);
    state = state.copyWith(appState: AppState.success);
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(const LoginState(), ref);
});
