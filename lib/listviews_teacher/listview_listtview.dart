import 'package:cookbook/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListviewListview extends StatelessWidget {
  const ListviewListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            margin: const EdgeInsets.all(10),
            color: Colors.amber,
            child: const Text("item 1"),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.purple,
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    '$index',
                    style: appstyle(20, Colors.deepOrange, FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade100,
            direction: ShimmerDirection.rtl,
            loop: 3,
            period: const Duration(seconds: 1),
            enabled: true,
            child: Container(
              alignment: Alignment.center,
              height: 150,
              margin: const EdgeInsets.all(10),
              color: Colors.amber,
              child: const Text("item 2"),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.purple,
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    '$index',
                    style: appstyle(20, Colors.deepOrange, FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            margin: const EdgeInsets.all(10),
            color: Colors.amber,
            child: const Text("item 3"),
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            margin: const EdgeInsets.all(10),
            color: Colors.amber,
            child: const Text("item 4"),
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            margin: const EdgeInsets.all(10),
            color: Colors.amber,
            child: const Text("item 5"),
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            margin: const EdgeInsets.all(10),
            color: Colors.amber,
            child: const Text("item 6"),
          ),
        ],
      ),
    );
  }
}
