import 'package:care_mate/services/auth_service.dart';
import 'package:riverpod/riverpod.dart';

import '../firebase/firebase_auth_provider.dart';

final authServiceProvider =
    Provider((ref) => AuthService(ref.read(firebaseAuthProvider)));
