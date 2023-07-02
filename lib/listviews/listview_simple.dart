// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class ListViewSimple extends StatelessWidget {
  const ListViewSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('listview simple'),
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        margin: EdgeInsets.all(20),
        child: ListView(
          padding: EdgeInsets.all(20), //adds additional layer of padding around the entire listview
          scrollDirection: Axis.vertical,
          reverse: false, // if true, makes the listview start from the bottom
          shrinkWrap: true, // if false: takes the H/W of the wrapped container, if true: minimizes the H/W as much as posible

          // physics:  ClampingScrollPhysics(), //default, only a slight effect when 'scrolling for a refresh'
          physics: BouncingScrollPhysics(), // bounces when 'scrolling for a refresh'
          // physics:  NeverScrollableScrollPhysics(), // no effect when 'scrolling for a refresh'

          // prototypeItem: SizedBox(height: 300, width: 200), // forces the children to have the same H OR W as the given widget

          //controller: //allows the listview to show only the "appropriate" part - such as filter, or return to top

          // cacheExtent: 600, //the number of px to be preloaded when the screen refreshes

          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //manual by defaul

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              height: 200,
              color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
              child: Text(
                'item1',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              height: 200,
              color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
              child: Text(
                'item2',
                style: TextStyle(fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
