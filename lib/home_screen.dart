import 'package:flutter/material.dart';

enum Menu { settings, help, showArchived, hideCompleted }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isShowArchived = false;
  bool _isHideCompleted = false;

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
          IconButton(
            tooltip: 'Sort',
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
          PopupMenuButton<Menu>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            offset: Offset(8.0, 8.0),
            tooltip: 'More options',
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem<Menu>(
                value: Menu.hideCompleted,
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return CheckboxListTile(
                    title: Text('Hide completed'),
                    activeColor: Color(0xFFF40057),
                    value: _isHideCompleted,
                    selected: _isHideCompleted,
                    onChanged: (bool value) {
                      setState(() {
                        _isHideCompleted = value;
                        Navigator.pop(context);
                      });
                    },
                    controlAffinity: ListTileControlAffinity.platform,
                  );
                }),
              ),
              PopupMenuItem<Menu>(
                value: Menu.showArchived,
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return CheckboxListTile(
                    title: Text('Show archived'),
                    selected: _isShowArchived,
                    activeColor: Color(0xFFF40057),
                    value: _isShowArchived,
                    onChanged: (bool value) {
                      setState(() {
                        _isShowArchived = value;
                        Navigator.pop(context);
                      });
                    },
                    controlAffinity: ListTileControlAffinity.platform,
                  );
                }),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.help,
                child: ListTile(title: Text('Help & Feedback')),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.settings,
                child: ListTile(title: Text('Settings')),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

// Sort:
// *by name
// *by score
// *by due date
// *by creation date
// *manually
