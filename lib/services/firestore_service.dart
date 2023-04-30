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

  Future<void> updatePatientData({
    required Patient patient,
  }) async {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');
      final DocumentReference patientDocRef =
          patientsCollectionRef.doc(patient.id);

      await patientDocRef.update(patient.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateBed({
    required Bed bed,
  }) async {
    try {
      final CollectionReference bedsCollectionRef =
          _firebaseFireStore.collection('beds');
      final DocumentReference bedDocRef = bedsCollectionRef.doc(bed.id);

      await bedDocRef.update(bed.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTemperatureMeasurement({required Patient patient}) async {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');
      final DocumentReference patientDocRef =
          patientsCollectionRef.doc(patient.id);

      final Map<String, dynamic> temperaturesMap = {
        'temperatures': patient.temperatures.map((t) => t.toJson()).toList()
      };
      await patientDocRef.update(temperaturesMap);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addBloodPressureMeasurement({required Patient patient}) async {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');
      final DocumentReference patientDocRef =
          patientsCollectionRef.doc(patient.id);

      final Map<String, dynamic> bloodPressuresMap = {
        'blood_pressures':
            patient.blood_pressures.map((t) => t.toJson()).toList()
      };

      await patientDocRef.update(bloodPressuresMap);
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
          .orderBy('name')
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
          .orderBy('name')
          .snapshots()
          .map((event) => event.docs
              .map((e) => Bed.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Patient>> getPatients() async {
    try {
      final querySnapshot =
          await _firebaseFireStore.collection('patients').get();
      final patients = querySnapshot.docs
          .map((doc) => Patient.fromJson(doc.data()))
          .toList();
      return patients;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Bed>> getBeds() async {
    try {
      final querySnapshot = await _firebaseFireStore.collection('beds').get();
      final beds =
          querySnapshot.docs.map((doc) => Bed.fromJson(doc.data())).toList();
      return beds;
    } catch (e) {
      rethrow;
    }
  }

  Future<Bed?> getBedByNfcId({required String nfcId}) async {
    try {
      final bedSnapshot = await FirebaseFirestore.instance
          .collection('beds')
          .where('nfc_id', isEqualTo: nfcId)
          .limit(1)
          .get();

      if (bedSnapshot.size == 0) {
        return null;
      }
      final bed = Bed.fromJson(bedSnapshot.docs.first.data());
      return bed;
    } catch (e) {
      rethrow;
    }
  }

  Future<Patient?> getPatientByBed({required String patientId}) async {
    try {
      final patientSnapshot = await FirebaseFirestore.instance
          .collection('patients')
          .where('id', isEqualTo: patientId)
          .limit(1)
          .get();

      if (patientSnapshot.size == 0) {
        return null;
      }
      final patient = Patient.fromJson(patientSnapshot.docs.first.data());
      return patient;
    } catch (e) {
      rethrow;
    }
  }
}
