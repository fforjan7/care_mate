import 'package:care_mate/data/providers/firestore/firestore_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientSearchView extends ConsumerStatefulWidget {
  const PatientSearchView({super.key});

  @override
  ConsumerState<PatientSearchView> createState() => _PatientSearchViewState();
}

class _PatientSearchViewState extends ConsumerState<PatientSearchView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(firestoreServiceProvider).getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search patient")),
      body: Column(children: const []),
    );
  }
}
