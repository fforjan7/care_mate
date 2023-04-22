import 'package:care_mate/data/models/request/patient_add_request.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/models/patient.dart';

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

  Future<List<Patient>> getPatients() async {
    final CollectionReference patientsCollectionRef =
        _firebaseFireStore.collection('patients');

    final QuerySnapshot snapshot =
        await patientsCollectionRef.get(const GetOptions(source: Source.cache));
    final List<QueryDocumentSnapshot> docs = snapshot.docs;

    final List<Patient> patients = [];

    for (var doc in docs) {
      final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        final Patient patient = Patient.fromJson(data);
        if (patient.blood_pressures.isNotEmpty) {
          print("\nAAAAAAAA:${patient.blood_pressures[0].measurement_time}\n");
        }
        patients.add(patient);
        // do something with the user data...
      }
    }
    print(patients);
    return patients;
  }
}
