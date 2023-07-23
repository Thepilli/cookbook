import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomColor() {
  Random random = Random();
  int red = random.nextInt(256); // Random value between 0 and 255
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  return Color.fromARGB(255, red, green, blue);
}

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and animate and iOS app from scratch',
    this.iconSrc = 'assets/animated_app/icons/ios.svg',
    this.bgColor = const Color(0xFF80A4FF),
  });
}

List<Course> courses = [
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in FLutter',
    iconSrc: 'assets/animated_app/icons/code.svg',
    bgColor: getRandomColor(),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in FLutter',
    iconSrc: 'assets/animated_app/icons/code.svg',
    bgColor: getRandomColor(),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in FLutter',
    iconSrc: 'assets/animated_app/icons/code.svg',
    bgColor: getRandomColor(),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in FLutter',
    iconSrc: 'assets/animated_app/icons/code.svg',
    bgColor: getRandomColor(),
  ),
];

List<Course> recentCourses = [
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in FLutter',
    iconSrc: 'assets/animated_app/icons/code.svg',
    bgColor: getRandomColor(),
  ),
  Course(title: 'Animation in SwiftUI'),
  Course(
    title: 'Animations in FLutter',
    iconSrc: 'assets/animated_app/icons/code.svg',
    bgColor: getRandomColor(),
  )
];
