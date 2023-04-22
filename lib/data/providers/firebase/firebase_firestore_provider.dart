import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);
