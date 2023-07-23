import 'package:cookbook/appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Animatedtn extends StatelessWidget {
  const Animatedtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.onTap,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 260,
        height: 64,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/animated_app/RiveAssets/button.riv',
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.arrow_right),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Lets get started',
                      style: appstyle(13, Colors.black, FontWeight.w600),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
