import 'package:care_mate/ui/views/patient/patiend_form_view.dart';
import 'package:care_mate/ui/views/patient/patient_blood_pressures_view.dart';
import 'package:care_mate/ui/views/patient/patient_temperature_view.dart';
import 'package:flutter/material.dart';

class PatientTabsView extends StatefulWidget {
  const PatientTabsView({Key? key}) : super(key: key);

  @override
  State<PatientTabsView> createState() => _PatientTabsViewState();
}

class _PatientTabsViewState extends State<PatientTabsView> {
  final List<Widget> _tabs = [
    const PatientFormView(),
    const PatientTemperaturesView(),
    const PatientBloodPressuresView()
  ];

  @override
  Widget build(BuildContext context) {
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
