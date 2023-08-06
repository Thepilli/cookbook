import 'package:flutter/material.dart';

class ReordableListview extends StatefulWidget {
  const ReordableListview({super.key});

  @override
  State<ReordableListview> createState() => _ReordableListviewState();
}

class _ReordableListviewState extends State<ReordableListview> {
  static List myTiles = [
    'A',
    'B',
    'C',
    'D',
    'E',
  ];
  final List<int> listerino = List<int>.generate(30, (index) => index);

  void updateMyTile(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      //get the position of the tile we are moving
      final item = listerino.removeAt(oldIndex);
      //place the tile to the new position
      listerino.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Reorbable List'),
      ),
      body: ReorderableListView(
        children: [
          for (final item in listerino)
            Container(
              alignment: Alignment.center,
              key: ValueKey(item),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepOrange),
              height: 50,
              margin: const EdgeInsets.all(20),
              child: Text(
                item.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
        ],
        onReorder: (oldIndex, newIndex) => updateMyTile(oldIndex, newIndex),
      ),
    );
  }
}
