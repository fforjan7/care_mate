import 'package:care_mate/data/models/bed.dart';
import 'package:care_mate/data/models/room.dart';
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

  Future<void> updatePatient({required Patient patient}) async {
    await _firestoreService.updatePatient(patient: patient);
  }

  Future<void> addFloor({required Floor floor}) async {
    return await _firestoreService.addFloor(floor: floor);
  }

  Future<void> addRoom({required Room room}) async {
    return await _firestoreService.addRoom(room: room);
  }

  Future<void> addBed({required Bed bed}) async {
    return await _firestoreService.addBed(bed: bed);
  }

  Stream<List<Patient>> streamPatients({required String searchInput}) {
    return _firestoreService.streamPatients(searchInput: searchInput);
  }

  Stream<List<Floor>> streamFloors() {
    return _firestoreService.streamFloors();
  }

  Stream<List<Room>> streamRooms({required Floor floor}) {
    return _firestoreService.streamRooms(floor: floor);
  }

  Stream<List<Bed>> streamBeds({required Room room}) {
    return _firestoreService.streamBeds(room: room);
  }

  Future<List<Bed>> getBeds({
    required String floor,
    required String room,
  }) async {
    return await _firestoreService.getBeds(floor: floor, room: room);
  }
}
