import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _searchController = TextEditingController();

  List _allResults = [];
  List _searchResults = [];

  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection('client').orderBy('name').get();
    setState(() {
      _allResults = data.docs;
    });
    _searchResulList();
  }

  @override
  void initState() {
    getClientStream();
    _searchController.addListener(_onSearchChange);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChange);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChange() {
    print(_searchController.text);
    _searchResulList();
  }

  void _searchResulList() {
    var showResults = [];
    if (_searchController.text != '') {
      for (var clientSnapshot in _allResults) {
        var name = clientSnapshot['name'].toString().toLowerCase();
        if (name.contains(
          _searchController.text.toLowerCase(),
        )) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _searchResults = showResults;
    });
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 350.w,
              child: Text(
                'Hello there, Where do you want to go today',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 30, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(5, 5),
                            blurRadius: 9,
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Reach places",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(5, 5),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.filter),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CupertinoTextField(
                prefix: const Icon(Icons.search),
                controller: _searchController,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _searchResults[index]['name'],
                    ),
                    subtitle: Text(
                      _searchResults[index]['email'],
                    ),
                    trailing: Text(
                      _searchResults[index]['mobile'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
