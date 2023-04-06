import 'package:care_mate/ui/views/discovery/discovery_view.dart';
import 'package:care_mate/ui/views/home/widgets/custom_grid_element.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patients management"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomGridElement(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DiscoveryView()));
                  },
                  icon: const Icon(Icons.gamepad),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                CustomGridElement(
                  onTap: () {},
                  icon: const Icon(Icons.people),
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
                  onTap: () {},
                  icon: const Icon(Icons.man),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                CustomGridElement(
                  onTap: () {},
                  icon: const Icon(Icons.woman),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}