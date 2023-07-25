import 'package:flutter/material.dart';

class TapToScroll extends StatefulWidget {
  const TapToScroll({super.key});

  @override
  State<TapToScroll> createState() => _TapToScrollState();
}

class _TapToScrollState extends State<TapToScroll> {
  final List<Color> _colors = const [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.greenAccent,
    Colors.cyan,
  ];

  final _containerHeight = 700.0;
  final ScrollController _scrollController = ScrollController();
  int _scrollIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(_updatedScrollIndex);
  }

  void _updatedScrollIndex() {
    setState(() {
      _scrollIndex = _scrollController.offset ~/ _containerHeight;
    });
  }

  void _onNumberTap(int index) {
    _scrollController.animateTo(index * _containerHeight, duration: const Duration(seconds: 1), curve: Curves.decelerate);
    setState(() {
      _scrollIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _colors[1],
          title: const Text("Tap to Scroll"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 90,
              width: double.infinity,
              child: ListView.builder(
                itemCount: _colors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _onNumberTap(index);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      decoration: index == _scrollIndex ? BoxDecoration(border: Border.all()) : null,
                      child: Text('${index + 1}'),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _colors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: _containerHeight,
                    color: _colors[index],
                    alignment: Alignment.center,
                    child: Text('${index + 1}', style: const TextStyle(fontSize: 30)),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
