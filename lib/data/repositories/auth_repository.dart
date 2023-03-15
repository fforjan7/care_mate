import 'package:care_mate/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return _authService.signInWithEmailAndPassword(email, password);
  }
}
