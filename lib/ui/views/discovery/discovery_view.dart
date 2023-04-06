import 'package:flutter/material.dart';

class DiscoveryView extends StatelessWidget {
  const DiscoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
      ),
      body: const Center(
        child: Text("DIscovery"),
      ),
    );
  }
}
