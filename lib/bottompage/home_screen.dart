// ignore_for_file: prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Create variable for change ListView and GridView
  bool _islistView = true;

  // Create Change ListView and GridView Function
  void _toggleView() {
    setState(() {
      _islistView = !_islistView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.grid_view_rounded),
          onPressed: () {
            _toggleView();
          },
        ),
        title: const Text('Products'),
      ),
      body: _islistView ? _listView() : _gridview(),
    );
  }
}

Widget _listView() {
  return ListView.builder(
    itemCount: 12,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: SizedBox(
          height: 350,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Text('data'),
          ),
        ),
      );
    },
  );
}

// _gridview Widget
Widget _gridview() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: 12,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                )
              ]),
          child: Text('data'),
        ),
      );
    },
  );
}
