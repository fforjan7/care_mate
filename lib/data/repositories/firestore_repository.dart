import 'package:care_mate/data/models/request/patient_add_request.dart';
import 'package:care_mate/services/firestore_service.dart';

import '../models/patient.dart';

class FirestoreRepository {
  final FirestoreService _firestoreService;
  FirestoreRepository(this._firestoreService);

  Future<void> addPatient({
    required PatientAddRequest patient,
  }) async {
    await _firestoreService.addPatient(patient: patient);
  }

  Future<List<Patient>> getPatients() async {
    return await _firestoreService.getPatients();
  }
}
