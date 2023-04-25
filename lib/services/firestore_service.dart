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

      print("\n =${patientsCollectionRef.doc().parent.id}\n");
      print("\n =${patientsCollectionRef.doc().id}\n");

      await patientDocRef.set(
        patient.copyWith(id: patientDocRef.id).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Patient>> streamPatients() {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');
      return patientsCollectionRef.orderBy('surname').snapshots().map((event) =>
          event.docs
              .map((e) => Patient.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  /* Future<List<Patient>> getPatients() async {
    try {
      final CollectionReference patientsCollectionRef =
          _firebaseFireStore.collection('patients');

      final QuerySnapshot snapshot = await patientsCollectionRef.get();
      final List<QueryDocumentSnapshot> docs = snapshot.docs;

      final List<Patient> patients = [];

      for (var doc in docs) {
        final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data != null) {
          final Patient patient = Patient.fromJson(data);
          if (patient.blood_pressures.isNotEmpty) {
            print(
                "\nAAAAAAAA:${patient.blood_pressures[0].measurement_time}\n");
          }
          patients.add(patient);
        }
      }
      print(patients);
      return patients;
    } catch (e) {
      rethrow;
    }
  } */

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

/*   Future<List<String>> getFloors() async {
    final List<String> floors = [];
    try {
      final CollectionReference floorsCollectionRef =
          _firebaseFireStore.collection('/hospital/kbc/floors');
      final QuerySnapshot snapshot = await floorsCollectionRef.get();
      final List<QueryDocumentSnapshot> docs = snapshot.docs;

      for (var doc in docs) {
        final String floor = doc.id;
        floors.add(floor);
      }
      print(floors);
      return floors;
    } catch (e) {
      rethrow;
    }
  } */

  Stream<List<Room>> streamRooms({required String floorId}) {
    try {
      final CollectionReference roomsCollectionRef =
          _firebaseFireStore.collection('rooms');
      return roomsCollectionRef
          .where('floor_id', isEqualTo: floorId)
          .snapshots()
          .map((event) => event.docs
              .map((e) => Room.fromJson(e.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  /* Future<List<String>> getRooms({required String floor}) async {
    final List<String> rooms = [];
    try {
      final CollectionReference roomsCollectionRef =
          _firebaseFireStore.collection('/hospital/kbc/floors/$floor/rooms');
      final QuerySnapshot snapshot = await roomsCollectionRef.get();
      final List<QueryDocumentSnapshot> docs = snapshot.docs;

      for (var doc in docs) {
        final String room = doc.id;
        rooms.add(room);
      }
      print(rooms);
      return rooms;
    } catch (e) {
      rethrow;
    }
  } */

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

  /* Future<List<Floor>> getHospitalLayout() async {
    final List<Floor> floors = [];

    try {
      //GET FLOORS
      final CollectionReference floorsCollectionRef =
          _firebaseFireStore.collection('/hospital/kbc/floors');
      final QuerySnapshot snapshot = await floorsCollectionRef.get();
      final List<QueryDocumentSnapshot> docs = snapshot.docs;
      // filtering through all of the floors (doc = floor)
      for (var doc in docs) {
        final String floorName = doc.id;
        final List<Room> rooms = [];
        //GET ROOMS
        final CollectionReference roomsCollectionRef = _firebaseFireStore
            .collection('/hospital/kbc/floors/$floorName/rooms');
        final QuerySnapshot snapshot = await roomsCollectionRef.get();
        final List<QueryDocumentSnapshot> docs = snapshot.docs;
        // filtering through all of the rooms (doc = room)
        for (var doc in docs) {
          final String roomName = doc.id;
          final List<Bed> beds = [];
          //GET BEDS
          final CollectionReference bedsCollectionRef =
              _firebaseFireStore.collection(
                  '/hospital/kbc/floors/$floorName/rooms/$roomName/beds');
          final QuerySnapshot snapshot = await bedsCollectionRef.get();
          final List<QueryDocumentSnapshot> docs = snapshot.docs;
          // filtering throug all of the beds (doc = bed)
          for (var doc in docs) {
            final String bedId = doc.id;
            final String patientId = doc.get("patient_id");
            final Bed bed = Bed(name: bedId, patientId: patientId);
            beds.add(bed);
          }
          //
          Room room = Room(name: roomName, beds: beds);
          rooms.add(room);
        }
        //
        Floor floor = Floor(name: floorName, rooms: rooms);
        floors.add(floor);
      }
      print(floors);
      return floors;
    } catch (e) {
      rethrow;
    }
  } */
}
