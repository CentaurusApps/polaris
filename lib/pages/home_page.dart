import 'package:flutter/material.dart';
import 'package:polaris/widgets/sort_dialog.dart';

enum Menu { settings, help, showArchived, hideCompleted }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isShowArchived = false;
  bool _isHideCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        title: Text(
          'My Habits',
          style: TextStyle(color: Colors.grey.shade900),
        ),
        actions: [
          IconButton(
            tooltip: 'Sort',
            icon: const Icon(Icons.sort),
            onPressed: () {
              showDialog(context: context, builder: (context) => SortDialog());
            },
          ),
          PopupMenuButton<Menu>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            offset: const Offset(8.0, 8.0),
            tooltip: 'More options',
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem<Menu>(
                value: Menu.hideCompleted,
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return CheckboxListTile(
                    title: const Text('Hide completed'),
                    activeColor: Theme.of(context).accentColor,
                    value: _isHideCompleted,
                    selected: _isHideCompleted,
                    onChanged: (bool value) {
                      setState(() {
                        _isHideCompleted = value;
                        Navigator.pop(context);
                      });
                    },
                  );
                }),
              ),
              PopupMenuItem<Menu>(
                value: Menu.showArchived,
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return CheckboxListTile(
                    title: const Text('Show archived'),
                    selected: _isShowArchived,
                    activeColor: Theme.of(context).accentColor,
                    value: _isShowArchived,
                    onChanged: (bool value) {
                      setState(() {
                        _isShowArchived = value;
                        Navigator.pop(context);
                      });
                    },
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
