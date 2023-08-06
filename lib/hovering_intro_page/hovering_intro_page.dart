import 'package:flutter/material.dart';

class HoveringImage extends StatefulWidget {
  const HoveringImage({super.key});

  @override
  State<HoveringImage> createState() => _HoveringImageState();
}

class _HoveringImageState extends State<HoveringImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(begin: Offset.zero, end: const Offset(0, 0.08)).animate(_controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 300,
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 15,
              left: 10,
              child: Image.asset(
                height: 50,
                'assets/images/cloud (2).png',
              ),
            ),
            SlideTransition(
              position: _animation,
              child: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/cloud.png',
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 10,
              child: Image.asset(
                height: 50,
                'assets/images/cloud (1).png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
