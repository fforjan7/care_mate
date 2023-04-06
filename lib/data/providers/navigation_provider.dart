import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enums/constants/routes.dart';

final navigationProvider = StateProvider<String>((ref) => AppRoutes.home);
