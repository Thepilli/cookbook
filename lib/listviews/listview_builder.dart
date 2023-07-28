// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cookbook/listviews/user.dart';
import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('ListView builder')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].profession),
            leading: CircleAvatar(
              backgroundImage: AssetImage(users[index].image),
            ),
          );
        },
      ),
    );
  }
}

//to demonstrate " cacheExtent: 600" property of a listview
Widget getItem(int index) {
  print('getItem called $index');
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(20),
    height: 200,
    color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
    child: Text(
      ' no $index',
      style: TextStyle(fontSize: 23),
    ),
  );
}
