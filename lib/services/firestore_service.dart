import 'package:care_mate/data/models/request/patient_add_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFireStore;

  FirestoreService(this._firebaseFireStore);

  Future<void> addPatient({
    required PatientAddRequest patient,
  }) async {
    final CollectionReference patientsCollectionRef =
        _firebaseFireStore.collection('patients');
    final DocumentReference patientDocRef = patientsCollectionRef.doc();

    print("\n =${patientsCollectionRef.doc().parent.id}\n");
    print("\n =${patientsCollectionRef.doc().id}\n");

    await patientDocRef.set(
      patient.copyWith(id: patientDocRef.id).toJson(),
    );
  }
}
