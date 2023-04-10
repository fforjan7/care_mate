import 'package:care_mate/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  User? getCurrentUser() {
    return _authService.getCurrentUser();
  }

  Future<void> signOut() async {
    await _authService.singOut();
  }
}
