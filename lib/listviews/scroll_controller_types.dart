import 'package:flutter/material.dart';

class ScrollControllerTypes extends StatelessWidget {
  ScrollControllerTypes({super.key});
  final double itemHeight = 150.0;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    scrollController.addListener(
      () {
        print(scrollController.offset);
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Scroll Controller types')),
      body: ListView.builder(
        controller: scrollController,
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
              onPressed: () {
                scrollController
                    .jumpTo(scrollController.position.minScrollExtent);
              },
              child: const Icon(Icons.arrow_upward_outlined)),
          FloatingActionButton(
              onPressed: () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              },
              child: const Icon(Icons.arrow_downward_outlined)),
          FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutCirc,
                    scrollController.position.minScrollExtent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('anim'.toUpperCase()),
                  const Icon(Icons.arrow_upward_outlined),
                ],
              )),
          FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate,
                    scrollController.position.maxScrollExtent);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('anim'.toUpperCase()),
                  const Icon(Icons.arrow_downward_outlined),
                ],
              )),
          FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutCirc,
                    scrollController.offset - itemHeight);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('item'.toUpperCase()),
                  const Icon(Icons.arrow_upward_outlined),
                ],
              )),
          FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate,
                    scrollController.offset + itemHeight);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('item'.toUpperCase()),
                  const Icon(Icons.arrow_downward_outlined),
                ],
              )),
        ],
      ),
    );
  }
}
