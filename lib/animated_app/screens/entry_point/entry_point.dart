import 'package:cookbook/animated_app/screens/entry_point/components/menu_btn.dart';
import 'package:cookbook/animated_app/screens/entry_point/components/side_menu.dart';
import 'package:cookbook/animated_app/screens/home_screen/home_screen.dart';
import 'package:cookbook/animated_app/screens/onboarding_screen/constants.dart';
import 'package:cookbook/animated_app/screens/entry_point/components/animated_bar.dart';
import 'package:cookbook/animated_app/models/rive_assets.dart';
import 'package:cookbook/animated_app/screens/onboarding_screen/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
    scaleAnimation =
        Tween<double>(begin: 1, end: .8).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isSideMenuClosed ? -288 : 0,
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
          Transform.translate(
            offset: Offset(animation.value * 288, 0),
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: HomeScreen(),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            top: 16,
            left: isSideMenuClosed ? 0 : 220,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveInput(artboard, stateMachineName: "State Machine");
                isSideBarClosed = controller.findSMI('isOpen') as SMIBool;
                isSideBarClosed.value = true;
              },
              onTap: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              color: backgroundColor2.withOpacity(.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                        });
                      }
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          bottomNavs[index].input!.change(false);
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav),
                        SizedBox(
                          height: 36,
                          width: (MediaQuery.of(context).size.width - 36) / 6,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src, //since the source is always the same, we can use the "first" one for all
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveInput(artboard, stateMachineName: bottomNavs[index].stateMachineName);
                                bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
