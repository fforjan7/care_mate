import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient.dart';

final initialPatientProvider = StateProvider((ref) => const Patient());
