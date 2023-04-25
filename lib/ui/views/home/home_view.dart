import 'package:care_mate/common/enums/constants/routes.dart';
import 'package:care_mate/data/providers/user_provider.dart';
import 'package:care_mate/ui/views/home/widgets/custom_grid_element.dart';
import 'package:care_mate/ui/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) async {
      await ref.read(userProvider.notifier).checkAdminRights();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patients management"),
      ),
      endDrawer: const ReusableDrawer(),
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
