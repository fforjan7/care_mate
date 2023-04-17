import 'package:care_mate/data/models/request/patient_add_request.dart';
import 'package:care_mate/data/models/state/patient_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFireStore;

  FirestoreService(this._firebaseFireStore);

  Future<void> addPatient(PatientAddRequest patient) async {
    final CollectionReference patientsCollectionRef =
        _firebaseFireStore.collection('patients');

    await patientsCollectionRef.add(patient);
  }
}
