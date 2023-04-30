import 'package:care_mate/ui/views/patient/patient_blood_pressures_view.dart';
import 'package:care_mate/ui/views/patient/patient_form_view.dart';
import 'package:care_mate/ui/views/patient/patient_temperature_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/bed.dart';
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

  Bed? patientsBed;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) async {
      patientsBed = await ref.read(tabsProvider.notifier).getPatientsBed();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(tabsProvider);

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Patient data'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: patientsBed != null
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Remove patient"),
                              content: const Text(
                                  "Are you sure you want to remove patient from the bed?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(tabsProvider.notifier)
                                        .removePatientFromBed(
                                            bed: patientsBed!);
                                    patientsBed = null;
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Remove',
                                      style: TextStyle(color: Colors.red[300])),
                                )
                              ],
                            );
                          },
                        );
                      },
                    )
                  : const SizedBox(),
            )
          ],
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
