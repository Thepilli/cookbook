import 'package:flutter/material.dart';

class ListViewColumn extends StatelessWidget {
  const ListViewColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/background.jpg'),
          SizedBox(
            // the items fill only the space of the column defined by the sized box
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                  ),
                );
              },
            ),
          ),
          Expanded(
            // the items fill the remaining space of the column = not restriced direction size
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    color: Colors.amber,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
