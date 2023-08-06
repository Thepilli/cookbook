import 'package:cookbook/mitch_koko/timeline_tile.dart';
import 'package:flutter/material.dart';

class TimelinePackage extends StatefulWidget {
  const TimelinePackage({super.key});

  @override
  State<TimelinePackage> createState() => _TimelinePackageState();
}

class _TimelinePackageState extends State<TimelinePackage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: const [
              //start tile
              MyTimelineTile(
                isFirst: true,
                isLast: false,
                isPast: true,
                eventCardChild: Text(
                    'ORDER PLACED'), //eventually to be switched for a proper card /w more info
              ),
              //middle tile
              MyTimelineTile(
                isFirst: false,
                isLast: false,
                isPast: true,
                eventCardChild: Text('ORDER SHIPPED'),
              ),
              //end tile
              MyTimelineTile(
                isFirst: false,
                isLast: true,
                isPast: false,
                eventCardChild: Text('ORDER RECEIVED'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
