import 'package:cookbook/flutter_animated/components/screenTitle.dart';
import 'package:cookbook/flutter_animated/components/trip_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/flutter_animated_images/bg.png"), fit: BoxFit.fitWidth, alignment: Alignment.topLeft),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                SizedBox(height: 160, child: ScreenTitle(text: 'My animated title')),
                Expanded(child: TripList())

                //Sandbox(),
              ],
            )));
  }
}
