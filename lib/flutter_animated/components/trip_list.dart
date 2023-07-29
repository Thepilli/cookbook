import 'package:cookbook/flutter_animated/detail_screen.dart';
import 'package:cookbook/flutter_animated/components/trip_model.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final List<Widget> _tripTiles = [];
  // final GlobalKey _listKey = GlobalKey();
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addTrips();
    });
  }

  void _addTrips() {
    // get data from db
    List<Trip> trips = [
      Trip(
          title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    Future ft = Future(
      () {},
    );
    for (var trip in trips) {
      ft = ft.then((value) => Future.delayed(
            const Duration(milliseconds: 300),
            () {
              _tripTiles.add(_buildTile(trip));
              _animatedListKey.currentState?.insertItem(_tripTiles.length - 1);
            },
          ));
    }
    //keeps track of which item is being aniamated
    //makes all the tiles to animate at the same time
    //  _tripTiles.add(_buildTile(trip));
    // _animatedListKey.currentState?.insertItem(_tripTiles.length - 1);
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(trip.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          //animates the transition of an objext from one place to another. Requires a unique tag value
          tag: trip.img,
          child: Image.asset(
            'assets/flutter_animated_images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  Tween<Offset> offset =
      Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //       key: _listKey,
  //       itemCount: _tripTiles.length,
  //       itemBuilder: (context, index) {
  //         return _tripTiles[index];
  //       });
  // }
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _animatedListKey,
        initialItemCount: _tripTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(offset),
            child: _tripTiles[index],
          );
        });
  }
}
