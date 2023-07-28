// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  //emits a value between 0-1 every second
  late AnimationController controller;
  late Animation<Color?> colorAnimation; //to animate a color, a 0-1 values are not sufficient,therefore we need aditional object
  late Animation<double> sizeAnimation;
  late Animation<double> curve; //to animate a color, a 0-1 values are not sufficient,therefore we need aditional object
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    ); //emits the value between 0-1 over the duration period

    curve = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(controller); //allows to get values between grey and red, instead of 0-1

    sizeAnimation = TweenSequence(//allows us to use multiple tweens at the same time
        <TweenSequenceItem<double>>[
      // animated size starts at 30, ends at 50, and the both are equally preffered
      TweenSequenceItem<double>(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(
        curve); //prevents the error:  A value of type 'TweenSequence<double>' can't be assigned to a variable of type 'Animation<double>'.

    controller.addListener(() {
      print(controller.value);
      print(colorAnimation.value);
    });

    controller.addStatusListener(
      (status) {
        print(status);
        if (status == AnimationStatus.completed) {
          setState(() {
            isFav = true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(
            () {
              isFav = false;
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: sizeAnimation.value,
          ),
          onPressed: () {
            isFav ? controller.reverse() : controller.forward(); //only starts the animation once pressed
          },
        );
      },
    );
  }
}
