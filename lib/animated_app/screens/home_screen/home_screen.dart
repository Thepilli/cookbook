import 'package:cookbook/animated_app/models/course.dart';
import 'package:cookbook/animated_app/screens/home_screen/components/course_card.dart';
import 'package:cookbook/animated_app/screens/home_screen/components/secondary_course_card.dart';
import 'package:cookbook/appstyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 50),
                child: Text("Courses", style: appstyle(40, Colors.white, FontWeight.w600)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map((course) => Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CourseCard(course: course),
                            ))
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Text("Recent", style: appstyle(30, Colors.white, FontWeight.w600)),
              ),
              ...recentCourses.map(
                (course) => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SecondaryCourseCard(course: course),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
