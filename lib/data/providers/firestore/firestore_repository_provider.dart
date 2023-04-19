import 'package:care_mate/data/providers/firestore/firestore_service_provider.dart';
import 'package:care_mate/data/repositories/firestore_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreRepositoryProvider =
    Provider((ref) => FirestoreRepository(ref.read(firestoreServiceProvider)));
