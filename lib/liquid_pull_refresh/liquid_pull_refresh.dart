import 'package:cookbook/liquid_pull_refresh/liquid_pull_refresh_data.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class LiquidPullRefresh extends StatefulWidget {
  const LiquidPullRefresh({super.key});

  @override
  State<LiquidPullRefresh> createState() => _LiquidPullRefreshState();
}

class _LiquidPullRefreshState extends State<LiquidPullRefresh> {
  final List<RefreshData> _data = [];

  @override
  void initState() {
    super.initState();
    _data.add(RefreshData(
      '0',
      'Start',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liquid Pull to Refresh')),
      body: LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: 2000,
        borderWidth: 4,
        backgroundColor: Colors.amber,
        color: Colors.teal,
        height: 100,
        onRefresh: () {
          var createdAt = DateTime.now();
          return Future.delayed(
            const Duration(milliseconds: 500),
            () {
              setState(() {
                _data.add(RefreshData('${_data.length}', 'Refreshed at ${createdAt.hour}:${createdAt.minute}'));
              });
            },
          );
        },
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            final RefreshData data = _data[index];
            return ListTile(
              leading: CircleAvatar(child: Text(data.id)),
              title: Text(data.text),
            );
          },
        ),
      ),
    );
  }
}
