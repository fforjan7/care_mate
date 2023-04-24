import 'package:care_mate/data/providers/services/firestore_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HospitalFloorsView extends ConsumerStatefulWidget {
  const HospitalFloorsView({super.key});

  @override
  ConsumerState<HospitalFloorsView> createState() => _HospitalFloorsViewState();
}

class _HospitalFloorsViewState extends ConsumerState<HospitalFloorsView> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var provider = ref.watch(firestoreServiceProvider);
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) async {
      await ref.read(firestoreServiceProvider).getHospitalLayout();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hospital floors")),
      body: Column(children: const []),
    );
  }
}
