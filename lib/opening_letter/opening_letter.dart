import 'package:cookbook/opening_letter/card.dart';
import 'package:flutter/material.dart';

class OpeningLetter extends StatefulWidget {
  const OpeningLetter({Key? key}) : super(key: key);

  @override
  State<OpeningLetter> createState() => _OpeningLetterState();
}

class _OpeningLetterState extends State<OpeningLetter> {
  var padding = 150.0;
  var bottomPadding = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Container(
                child: CardItem(
                  color: Colors.pink,
                  onTap: () {
                    setState(() {
                      padding = padding == 0 ? 150.0 : 0.0;
                      bottomPadding = bottomPadding == 0 ? 150.0 : 0.0;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4), blurRadius: 30),
                  ],
                  color: Colors.grey.shade200.withOpacity(1),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 70,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
