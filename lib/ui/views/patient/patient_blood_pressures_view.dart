import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/tabs_provider.dart';
import '../../widgets/custom_Popup.dart';

class PatientBloodPressuresView extends ConsumerWidget {
  const PatientBloodPressuresView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(tabsProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: CustomPopupForm(
                  popupTitle:
                      "Enter systolic, diastolic and measurement time values",
                  textInputType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false,
                  ),
                  title1: "Systolic value",
                  onChanged1: (value) {
                    ref.read(tabsProvider.notifier).setSystolicValue(value);
                  },
                  title2: "Diastolic value",
                  onChanged2: (value) {
                    ref.read(tabsProvider.notifier).setDiastlicValue(value);
                  },
                  isFullDateTimeFormat: true,
                  setDate: ref
                      .read(tabsProvider.notifier)
                      .setBloodPressureMeasurementTime,
                  onPressed: () async => await ref
                      .read(tabsProvider.notifier)
                      .addBloodPressureMeasurement(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: provider.bloodPressures.isEmpty
          ? const Center(child: Text("No current measurements"))
          : ListView.separated(
              itemCount: provider.bloodPressures.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.favorite, color: Colors.red[300]),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Systolic value: "),
                          Text(
                            provider.bloodPressures[index].systolic,
                            style: TextStyle(
                              color: Colors.blue[400],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Diastolic value: "),
                          Text(
                            provider.bloodPressures[index].diastolic,
                            style: TextStyle(
                              color: Colors.blue[400],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  dense: false,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Measurement time:"),
                      Text(
                        provider.bloodPressures[index].measurement_time,
                        style: TextStyle(
                          color: Colors.blue[400],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
