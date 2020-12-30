import 'package:flutter/material.dart';

enum Menu { settings, about, help }
enum Filter { hideArchived, hideCompleted, sort }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text(
          'My Habits',
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          PopupMenuButton<Filter>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            offset: Offset(8.0, 8.0),
            tooltip: 'Filter',
            icon: Icon(Icons.filter_list),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Filter>>[
              const PopupMenuItem<Filter>(
                value: Filter.hideArchived,
                child: Text('Hide archived'),
              ),
              const PopupMenuItem<Filter>(
                value: Filter.hideCompleted,
                child: Text('Hide completed'),
              ),
              const PopupMenuItem<Filter>(
                value: Filter.sort,
                child: Text('Sort'),
              ),
            ],
          ),
          PopupMenuButton<Menu>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            offset: Offset(8.0, 8.0),
            tooltip: 'More options',
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.settings,
                child: Text('Settings'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.help,
                child: Text('Help and FAQ'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.about,
                child: Text('About'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        verticalOffset: 48.0,
        message: 'Create a new habit',
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
