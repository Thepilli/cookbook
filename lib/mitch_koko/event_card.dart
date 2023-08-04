// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  const EventCard({
    Key? key,
    required this.isPast,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isPast ? Colors.pink : Colors.pinkAccent.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
