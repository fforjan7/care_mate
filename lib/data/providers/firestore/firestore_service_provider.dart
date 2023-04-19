import 'package:care_mate/data/providers/firestore/firebase_firestore_provider.dart';
import 'package:care_mate/services/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreServiceProvider =
    Provider((ref) => FirestoreService(ref.read(firebaseFirestoreProvider)));
