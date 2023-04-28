import 'package:care_mate/ui/views/patient/patient_blood_pressures_view.dart';
import 'package:care_mate/ui/views/patient/patient_form_view.dart';
import 'package:care_mate/ui/views/patient/patient_temperature_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/patient.dart';
import '../../../data/providers/tabs_provider.dart';

class PatientTabsView extends ConsumerStatefulWidget {
  const PatientTabsView({Key? key}) : super(key: key);

  @override
  ConsumerState<PatientTabsView> createState() => _PatientTabsViewState();
}

class _PatientTabsViewState extends ConsumerState<PatientTabsView> {
  final List<Widget> _tabs = [
    const PatientFormView(),
    const PatientTemperaturesView(),
    const PatientBloodPressuresView()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(tabsProvider);

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Patient data'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.thermostat)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}
