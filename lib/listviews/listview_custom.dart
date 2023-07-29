// ignore_for_file: prefer_const_constructors

import 'package:cookbook/listviews/listview_builder.dart';
import 'package:cookbook/listviews/user.dart';
import 'package:flutter/material.dart';

class ListViewCustomList extends StatelessWidget {
  const ListViewCustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Custom')),

      ///used for complex layouts with diferent sizes and shapes
      /// SliverChildDelegate defines the interface for childs within a sliver
      /// either SliverChildListDelegate or SliverChildBuilderDelegate
      body: ListView.custom(
          childrenDelegate: SliverChildListDelegate([
        getItem(1),
        getItem(2),
        getItem(3),
        getItem(4),
        getItem(5),
        getItem(6),
        getItem(7),
        getItem(8),
        getItem(9),
      ])),
    );
  }
}

class ListViewCustomBuilder extends StatelessWidget {
  const ListViewCustomBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Custom')),

      ///used for complex layouts with diferent sizes and shapes
      /// SliverChildDelegate defines the interface for childs within a sliver
      /// either SliverChildListDelegate or SliverChildBuilderDelegate
      body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            leading:
                CircleAvatar(backgroundImage: AssetImage(users[index].image)),
            title: Text(users[index].name + '  $index'),
            subtitle: Text(users[index].profession),
          );
        },
        childCount: users.length,
      )),
    );
  }
}
