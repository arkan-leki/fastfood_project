import 'package:flutter/material.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        searchHint: "گەڕان ... ",
        iconified: true,
        defaultBar: AppBar(
          iconTheme: IconThemeData(color: Colors.amber),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "بەشی گەڕان",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
