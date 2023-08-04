import 'package:flutter/material.dart';

class ScrollControllerPosition extends StatefulWidget {
  const ScrollControllerPosition({super.key});

  @override
  State<ScrollControllerPosition> createState() =>
      _ScrollControllerPositionState();
}

class _ScrollControllerPositionState extends State<ScrollControllerPosition> {
  final double itemHeight = 150.0;

  final ScrollController _scrollController = ScrollController();
  String _scrollLocation = 'At the top';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(listenToScrollMovement);
  }

  void listenToScrollMovement() {
    String currentLocation = "";
    if (_scrollController.offset ==
        _scrollController.position.minScrollExtent) {
      currentLocation = "at the top";
    } else if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent) {
      currentLocation = "at the bottom";
    } else {
      currentLocation = "in the middle";
    }
    setState(() {
      _scrollLocation = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(
      () {
        print(_scrollController.offset);
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text(_scrollLocation)),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: itemHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: index % 2 == 0 ? Colors.cyan : Colors.teal),
            child: Text(
              '$index',
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );
  }
}
