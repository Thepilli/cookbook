import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Color color;
  final void Function()? onTap;

  const CardItem({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.pink.withOpacity(0.4), blurRadius: 30),
        ], color: color.withOpacity(1), borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('data'),
              SizedBox(height: 20),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
