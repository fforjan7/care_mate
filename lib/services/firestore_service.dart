import 'package:care_mate/data/models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/bed.dart';
import '../data/models/floor.dart';
import '../data/models/patient.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFireStore;

  FirestoreService(this._firebaseFireStore);

  Future<bool> checkAdminRights({required User? user}) async {
    try {
      final CollectionReference adminsCollectionRef =
          _firebaseFireStore.collection('admins');
      final QuerySnapshot snapshot = await adminsCollectionRef.get();
      final List<QueryDocumentSnapshot> docs = snapshot.docs;

      final List<String> admins = [];

      for (var doc in docs) {
        final String uuid = doc.id;
        admins.add(uuid);
      }

      if (user != null) {
        return admins.contains(user.uid);
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addPatient({
    required Patient patient,
  }) async {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');
      final DocumentReference patientDocRef = patientsCollectionRef.doc();

      await patientDocRef.set(
        patient.copyWith(id: patientDocRef.id).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addFloor({
    required Floor floor,
  }) async {
    try {
      final CollectionReference floorsCollectionRef =
          _firebaseFireStore.collection('floors');
      final DocumentReference floorDocRef = floorsCollectionRef.doc();

      await floorDocRef.set(
        floor.copyWith(id: floorDocRef.id).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addRoom({
    required Room room,
  }) async {
    try {
      final CollectionReference roomsCollectionRef =
          _firebaseFireStore.collection('rooms');
      final DocumentReference roomDocRef = roomsCollectionRef.doc();

      await roomDocRef.set(
        room.copyWith(id: roomDocRef.id).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addBed({
    required Bed bed,
  }) async {
    try {
      final CollectionReference bedCollectionRef =
          _firebaseFireStore.collection('beds');
      final DocumentReference bedDocRef = bedCollectionRef.doc();

      await bedDocRef.set(
        bed.copyWith(id: bedDocRef.id).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Patient>> streamPatients({required String searchInput}) {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');
      return patientsCollectionRef.orderBy("surname").snapshots().map((event) =>
          event.docs
              .map((e) => Patient.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Floor>> streamFloors() {
    try {
      final CollectionReference floorsCollectionRef =
          _firebaseFireStore.collection('floors');
      return floorsCollectionRef.orderBy('name').snapshots().map((event) =>
          event.docs
              .map((e) => Floor.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Room>> streamRooms({required Floor floor}) {
    try {
      final CollectionReference roomsCollectionRef =
          _firebaseFireStore.collection('rooms');
      return roomsCollectionRef
          .where('floor_id', isEqualTo: floor.id)
          .snapshots()
          .map((event) => event.docs
              .map((e) => Room.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Bed>> streamBeds({required Room room}) {
    try {
      final CollectionReference roomsCollectionRef =
          _firebaseFireStore.collection('beds');
      return roomsCollectionRef
          .where('room_id', isEqualTo: room.id)
          .snapshots()
          .map((event) => event.docs
              .map((e) => Bed.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Bed>> getBeds({
    required String floor,
    required String room,
  }) async {
    final List<Bed> beds = [];
    try {
      final CollectionReference bedsCollectionRef = _firebaseFireStore
          .collection('/hospital/kbc/floors/$floor/rooms/$room/beds');
      final QuerySnapshot snapshot = await bedsCollectionRef.get();
      final List<QueryDocumentSnapshot> docs = snapshot.docs;

      for (var doc in docs) {
        final String bedId = doc.id;
        print(doc.id);
        final String patientId = doc.get("patient_id");
        final Bed bed = Bed(name: bedId, patientId: patientId);
        beds.add(bed);
      }
      print(beds);
      return beds;
    } catch (e) {
      rethrow;
    }
  }
}
