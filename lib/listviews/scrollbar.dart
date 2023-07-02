// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class ScrollBarWidget extends StatelessWidget {
  const ScrollBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrollbar')),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 20,
        radius: Radius.circular(20),
        interactive: true,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              height: 200,
              color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
              child: Text(
                'item no $index',
                style: TextStyle(fontSize: 23),
              ),
            );
          },
        ),
      ),
    );
  }
}
