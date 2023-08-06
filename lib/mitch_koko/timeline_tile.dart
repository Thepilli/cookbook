import 'package:cookbook/mitch_koko/event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  const MyTimelineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.eventCardChild});
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventCardChild;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //defines the gap between individual events
      height: 200,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,

          //decoration?
          beforeLineStyle: LineStyle(
              color: isPast ? Colors.pink : Colors.pinkAccent.shade100),
          indicatorStyle: IndicatorStyle(
              color: isPast ? Colors.pink : Colors.pinkAccent.shade100,
              width: 30,
              iconStyle: IconStyle(
                  iconData: Icons.done,
                  color: isPast
                      ? Colors.white
                      : Colors.pinkAccent.shade100)), //the icon is camouflaged
          endChild: EventCard(isPast: isPast, child: eventCardChild)),
    );
  }
}
