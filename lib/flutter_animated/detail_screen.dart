import 'package:cookbook/flutter_animated/components/heart.dart';
import 'package:cookbook/flutter_animated/components/trip_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Trip trip;
  const Details({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Hero(
                tag: trip.img,
                child: Image.asset(
                  'assets/flutter_animated_images/${trip.img}',
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
                title: Text(
                  trip.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[800]),
                ),
                subtitle: Text(
                  '${trip.nights} night stay for only \$${trip.price}',
                  style: const TextStyle(letterSpacing: 1),
                ),
                trailing: const Heart()),
          ],
        ),
      ),
    );
  }
}
