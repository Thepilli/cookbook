import 'package:flutter/material.dart';

class AnimatedSandbox extends StatefulWidget {
  const AnimatedSandbox({super.key});

  @override
  State<AnimatedSandbox> createState() => _AnimatedSandboxState();
}

class _AnimatedSandboxState extends State<AnimatedSandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: () => setState(() => _margin = 50),
              child: const Text('Animate Margin'),
            ),
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: () => setState(() => _color = Colors.amber),
              child: const Text('Animate color'),
            ),
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: () => setState(() => _width = 300),
              child: const Text('Animate Width'),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _opacity,
              child: MaterialButton(
                color: Colors.pinkAccent,
                onPressed: () => setState(() => _opacity = .1),
                child: const Text('Animate Opacity'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
