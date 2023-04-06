import 'package:care_mate/common/enums/constants/routes.dart';
import 'package:riverpod/riverpod.dart';

final navigationProvider = StateProvider<String>((ref) => AppRoutes.home);
