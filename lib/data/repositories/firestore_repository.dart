import 'package:care_mate/data/models/bed.dart';
import 'package:care_mate/services/firestore_service.dart';

import '../models/patient.dart';

class FirestoreRepository {
  final FirestoreService _firestoreService;
  FirestoreRepository(this._firestoreService);

  Future<void> addPatient({
    required Patient patient,
  }) async {
    await _firestoreService.addPatient(patient: patient);
  }

  Future<List<Patient>> getPatients() async {
    return await _firestoreService.getPatients();
  }

  Future<List<String>> getFloors() async {
    return await _firestoreService.getFloors();
  }

  Future<List<String>> getRooms({required String floor}) async {
    return await _firestoreService.getRooms(floor: floor);
  }

  Future<List<Bed>> getBeds({
    required String floor,
    required String room,
  }) async {
    return await _firestoreService.getBeds(floor: floor, room: room);
  }
}
