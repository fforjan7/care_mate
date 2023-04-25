import 'package:care_mate/common/enums/constants/routes.dart';
import 'package:flutter/material.dart';

import 'custom_list_tile.dart';

class ReusableDrawer extends StatelessWidget {
  const ReusableDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: const [
            /*Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ReusableListTile(
                icon: AppIcons.home,
                title: AppLocalizations.of(context).home,
                route: AppRoutes.home,
              ),
            ),*/
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: ReusableListTile(
                title: "Edit hospital layout",
                route: AppRoutes.hospitalFLoors,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: ReusableListTile(
                title: "Logout",
                isLogout: true,
                route: AppRoutes.login,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
