import 'package:cookbook/animated_app/models/rive_assets.dart';
import 'package:cookbook/animated_app/screens/entry_point/components/info_card.dart';
import 'package:cookbook/animated_app/screens/onboarding_screen/constants.dart';
import 'package:cookbook/animated_app/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import 'side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenu1.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288.w,
        height: double.infinity,
        color: backgroundColor2,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                  name: 'Jiri Pillar', profession: 'developer wannabe'),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text(
                  'Browse'.toUpperCase(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ...sideMenu1.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  onTap: () {
                    menu.input!.change(true);
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        menu.input!.change(false);
                      },
                    );
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                  riveonInit: (artboard) {
                    StateMachineController controller = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text(
                  'History'.toUpperCase(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ...sideMenus2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  onTap: () {
                    menu.input!.change(true);
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        menu.input!.change(false);
                      },
                    );
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                  riveonInit: (artboard) {
                    StateMachineController controller = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
