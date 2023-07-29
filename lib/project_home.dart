import 'package:cookbook/animated_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:cookbook/dialog_boxes/dialog_box.dart';
import 'package:cookbook/filter_widget/filter_widget.dart';
import 'package:cookbook/firebase_counter/firebase_counter.dart';
import 'package:cookbook/liquid_pull_refresh/liquid_pull_refresh.dart';
import 'package:cookbook/listviews/listview_builder.dart';
import 'package:cookbook/opening_letter/opening_letter.dart';
import 'package:cookbook/scratcher/scratcher.dart';
import 'package:cookbook/stepper_widget/stepper_home_page.dart';
import 'package:flutter/material.dart';

import 'pretty_animated_buttons/pretty_animated_buttons.dart';

class ProjectHome extends StatelessWidget {
  ProjectHome({super.key});

  final List myProjects = [
    {"name": "Animated App", 'route': ""},
    {"name": "Dialog boxes", 'route': ''},
    {"name": "Filter Widget", 'route': ''},
    {"name": "Liquid pull widget", 'route': ''},
    {"name": "List views course", 'route': ''},
    {"name": "Opening letter widget", 'route': ''},
    {"name": "Pretty animated buttons", 'route': ''},
    {"name": "Scratcher widget", 'route': ''},
    {"name": "Stepper widget", 'route': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(backgroundColor: Colors.transparent, title: const Text('Select the project you want to check')),
        body: ListView(
          children: [
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ));
                },
                child: const Text('Animated App'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AwesomeDialogBox(),
                      ));
                },
                child: const Text('Dialog boxes'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterWidget(),
                      ));
                },
                child: const Text('Filter Widget'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LiquidPullRefresh(),
                      ));
                },
                child: const Text('Liquid pull widget'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OpeningLetter(),
                      ));
                },
                child: const Text('Opening letter widget'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListViewBuilder(),
                      ));
                },
                child: const Text('List views course'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrettyAnimatedButtons(),
                      ));
                },
                child: const Text('Pretty animated buttons'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScratcherWidget(),
                      ));
                },
                child: const Text('Scratcher widget'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StepperHomePage(),
                      ));
                },
                child: const Text('Stepper widget'),
              ),
            ),
            Container(
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterPage(),
                      ));
                },
                child: const Text('Counter Page with firestore'),
              ),
            ),
          ],
        ));
  }
}
