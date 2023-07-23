import 'package:cookbook/animated_app/models/course.dart';
import 'package:cookbook/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  course.title,
                  style: appstyle(24, Colors.white, FontWeight.w600),
                ),
                Text(
                  'Watch video -- 15 mins',
                  style: appstyle(16, Colors.white60, FontWeight.normal),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}
