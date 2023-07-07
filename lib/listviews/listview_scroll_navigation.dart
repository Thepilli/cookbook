import 'package:flutter/material.dart';

class ListViewScrollNavigation extends StatelessWidget {
  ListViewScrollNavigation({super.key});

  final List<Color> _colors = [
    const Color(0XFF1ABC9C),
    const Color(0XFF2ECC71),
    const Color(0XFF3498DB),
    const Color(0XFF9B5986),
    const Color(0XFF34495E),
    const Color(0XFFFAC40F),
    const Color(0XFFE67E22),
    const Color(0XFFE74C3C),
    const Color(0XFFDB94D4),
    const Color(0XFF95A5A6),
  ];
  final double _containerHeight = 300;
  final ScrollController _scrollController = ScrollController();
  void _scrollToTap(int index) {
    _scrollController.animateTo(index * _containerHeight, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Scroll Navigation')),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.builder(
              itemCount: _colors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _scrollToTap(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 100,
                    height: 100,
                    color: _colors[index],
                    child: Center(
                        child: Text(
                      index.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _colors.length,
              itemBuilder: (context, index) {
                return Container(
                  color: _colors[index],
                  height: _containerHeight,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
