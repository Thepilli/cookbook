import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratcherWidget extends StatelessWidget {
  const ScratcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Scratcher(
            brushSize: 30,
            threshold: 50,
            color: Colors.red,
            onChange: (value) => print("Scratch progress: $value%"),
            onThreshold: () => print("Threshold reached, you won!"),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
