import 'package:care_mate/data/repositories/firestore_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/firestore_service_provider.dart';

final firestoreRepositoryProvider =
    Provider((ref) => FirestoreRepository(ref.read(firestoreServiceProvider)));
