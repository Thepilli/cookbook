// ignore_for_file: prefer_const_constructors

import 'package:cookbook/listviews/user.dart';
import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Separated')),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (context, index) {
          /// creates a logic where every 4th item is an ad separator, otherwise en empty space
          return (index + 4) % 3 == 0
              ? Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black26)),
                  child: ListTile(
                    title: Text('advertisement'),
                    subtitle: Text('are you interested in women in your area?'),
                    trailing: Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      height: 20,
                      width: 30,
                      child: Text('ad'),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text('A'),
                    ),
                  ),
                )
              : SizedBox();
        },
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(users[index].image),
            ),
            title: Text(users[index].name + " $index"),
            subtitle: Text(users[index].profession + " $index"),
          );
        },
      ),
    );
  }
}
