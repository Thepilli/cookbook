import 'package:cookbook/search_with_delegate/custom_search_delegate.dart';
import 'package:cookbook/search_with_delegate/search_result_page.dart';
import 'package:flutter/material.dart';

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

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> filteredList = searchTerms;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Search with custom delegate  ==>'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: const InputDecoration(hintText: 'search'),
            onChanged: (value) {
              filteredList = searchTerms.where((element) {
                //case match:
                //final query = element.contains(value);
                //case-less match:
                // final query = element.toLowerCase().contains(value.toLowerCase());
                //match starting character:
                final query = element.toLowerCase().startsWith(value.toLowerCase());
                return query;
              }).toList();
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultPage(
                            searchResult: filteredList[index],
                          ),
                        ));
                  },
                  title: Text(filteredList[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
