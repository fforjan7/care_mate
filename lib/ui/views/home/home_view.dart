import 'package:care_mate/common/enums/constants/routes.dart';
import 'package:care_mate/ui/views/home/widgets/custom_grid_element.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patients management"),
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.settings);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomGridElement(
                  icon: Icons.nfc,
                  title: "Scan nfc",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.nfc);
                  },
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                CustomGridElement(
                  icon: Icons.add,
                  title: "Add new patient",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.patientAdd);
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomGridElement(
                  icon: Icons.people,
                  title: "Search patients",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.patientSearch);
                  },
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                CustomGridElement(
                  icon: Icons.room,
                  title: "Hospital layout",
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.hospitalFLoors);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
