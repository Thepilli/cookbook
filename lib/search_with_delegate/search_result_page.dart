import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final String searchResult;
  const SearchResultPage({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: Text(searchResult)),
    );
  }
}
