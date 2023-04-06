import 'package:care_mate/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
