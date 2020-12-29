import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56.0,
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.all(16.0),
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                padding: EdgeInsets.all(16.0),
                icon: Icon(Icons.filter_list),
                tooltip: 'Filter',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
