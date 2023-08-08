import 'package:cookbook/search_with_delegate/search_result_page.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<String> searchTerms = [
    'Liam',
    'Noah',
    'Oliver',
    'James',
    'Elijah',
    'William',
    'Henry',
    'Lucas',
    'Benjamin',
    'Theodore',
    'Mateo',
    'Levi',
    'Sebastian',
    'Daniel',
    'Jack',
    'Michael',
    'Alexander',
  ];

  @override
  List<Widget>? buildActions(context) {
    //return in [] because we are working with a list as the actions property is a list of widgets
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  //the values displayed when search button is clicked /finished
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in searchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        // return Container(
        //   decoration: const BoxDecoration(color: Colors.amber),
        //   padding: const EdgeInsets.all(10),
        //   margin: const EdgeInsets.all(10),
        //   child: Text(result),
        // );
        return ListTile(
          title: Text(
            result,
            style: const TextStyle(color: Colors.red),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResultPage(searchResult: result),
                ));
          },
        );
      },
    );
  }

  @override
  //the values displayed when seachfield is active
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in searchTerms) {
      // if (name.toLowerCase().contains(query.toLowerCase())) {
      //   matchQuery.add(name);
      // }
      if (name.toLowerCase().startsWith(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResultPage(searchResult: result),
                ));
          },
        );
      },
    );
  }
}
