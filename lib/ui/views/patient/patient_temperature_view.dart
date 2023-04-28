import 'package:care_mate/data/providers/tabs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/custom_Popup.dart';

class PatientTemperaturesView extends ConsumerWidget {
  const PatientTemperaturesView({super.key});

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
                  popupTitle: "Enter temperatures measurement value and time",
                  textInputType: const TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  title1: "Measurement value",
                  onChanged1: (value) {
                    ref.read(tabsProvider.notifier).setTemperatureValue(value);
                  },
                  isFullDateTimeFormat: true,
                  setDate: ref
                      .read(tabsProvider.notifier)
                      .setTemperatureMeasurementTime,
                  onPressed: () async => await ref
                      .read(tabsProvider.notifier)
                      .addTemperatureMeasurement(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.separated(
        itemCount: provider.temperatures.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(provider.temperatures[index].measurement_value),
          );
        },
      ),
    );
  }
}
