// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  const SingleChildScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //used for fitting all widgets on a screen with scrollable behaviour
    //also great when accomomdating keyborads, and other popping features
    return Scaffold(
      appBar: AppBar(title: Text('SingleChildScrollView')),
      body: SingleChildScrollView(
        reverse: false,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              color: Color.fromARGB(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255)),
              child: Text(
                'item1',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              color: Color.fromARGB(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255)),
              child: Text(
                'item2',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              color: Color.fromARGB(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255)),
              child: Text(
                'item3',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              color: Color.fromARGB(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255)),
              child: Text(
                'item3',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              color: Color.fromARGB(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255)),
              child: Text(
                'item3',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              color: Color.fromARGB(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255)),
              child: Text(
                'item3',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
