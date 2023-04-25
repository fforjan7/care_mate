import 'package:care_mate/data/models/bed.dart';
import 'package:care_mate/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/floor.dart';
import '../models/patient.dart';

class FirestoreRepository {
  final FirestoreService _firestoreService;
  FirestoreRepository(this._firestoreService);

  Future<bool> checkAdminRights({required User? user}) async {
    return await _firestoreService.checkAdminRights(user: user);
  }

  Future<void> addPatient({
    required Patient patient,
  }) async {
    await _firestoreService.addPatient(patient: patient);
  }

  Stream<List<Patient>> streamPatients() {
    return _firestoreService.streamPatients();
  }

  Stream<List<Floor>> streamFloors() {
    return _firestoreService.streamFloors();
  }

/*   Future<List<String>> getRooms({required String floor}) async {
    return await _firestoreService.getRooms(floor: floor);
  } */

  Future<List<Bed>> getBeds({
    required String floor,
    required String room,
  }) async {
    return await _firestoreService.getBeds(floor: floor, room: room);
  }
}
