import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NfcView extends ConsumerStatefulWidget {
  const NfcView({super.key});

  @override
  ConsumerState<NfcView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends ConsumerState<NfcView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new patient")),
      body: Column(children: const []),
    );
  }
}
