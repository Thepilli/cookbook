import 'package:cookbook/animated_app/models/course.dart';
import 'package:cookbook/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: appstyle(24, Colors.white, FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    course.description,
                    style: appstyle(15, Colors.white70, FontWeight.normal),
                  ),
                ),
                Text(
                  '61 SECTIONS  -- 11 HOURS',
                  style: appstyle(12, Colors.white70, FontWeight.normal),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                      3,
                      (index) => Transform.translate(
                            offset: Offset((-10 * index).toDouble(), 0),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage('assets/animated_app/avaters/Avatar ${index + 1}.jpg'),
                            ),
                          )),
                )
              ],
            ),
          ),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}
