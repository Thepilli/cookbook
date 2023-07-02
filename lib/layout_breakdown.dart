// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cookbook/fade_animation.dart';
import 'package:flutter/material.dart';

class LayouBreakdown extends StatelessWidget {
  const LayouBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //image
          FadeAnimation(delay: 2, child: Image(image: AssetImage('assets/images/layout_breakdown.png'))),
          //title row
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Oeschinen Lake Campground'),
                      Text('Kandersteg, Switzerland'),
                    ],
                  ),
                ),
                Icon(Icons.star),
                Text('41'),
              ],
            ),
          ),

          //buttons row
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButtonColumn(color: Colors.amber, label: 'CALL', iconName: Icons.phone),
                _buildButtonColumn(color: Colors.amber, label: 'ROUTE', iconName: Icons.map),
                _buildButtonColumn(color: Colors.amber, label: 'SHARE', iconName: Icons.share),
              ],
            ),
          ),
          //text
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
                softWrap: true,
                "loren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsumloren ipsum"),
          )
        ],
      ),
    );
  }
}

class _buildButtonColumn extends StatelessWidget {
  final Color color;
  final IconData iconName;
  final String label;
  const _buildButtonColumn({
    required this.color,
    required this.label,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconName,
          color: color,
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
