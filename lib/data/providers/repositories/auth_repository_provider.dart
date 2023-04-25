import 'package:care_mate/data/repositories/auth_repository.dart';
import 'package:riverpod/riverpod.dart';
import '../services/auth_service_provider.dart';

final authRepositoryProvider =
    Provider((ref) => AuthRepository(ref.read(authServiceProvider)));
