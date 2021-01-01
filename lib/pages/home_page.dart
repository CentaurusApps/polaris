import 'package:flutter/material.dart';

enum Menu { settings, help, showArchived, hideCompleted }
enum Sort { name, score, dueDate, manually }

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
          style: TextStyle(color: Colors.grey[900]),
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
                    activeColor: const Color(0xFFF40057),
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
                    activeColor: const Color(0xFFF40057),
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

class SortDialog extends StatefulWidget {
  @override
  _SortDialogState createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  Sort _selectedRadio = Sort.score;

  Map<String, Sort> dialogOptions = {
    'My order': Sort.manually,
    'Score': Sort.score,
    'Date': Sort.dueDate,
    'Name': Sort.name,
  };

  List<Widget> getRadios(Map<String, Sort> map) {
    final List<RadioListTile> radioList = [];
    map.forEach((key, value) {
      final newRadio = RadioListTile<Sort>(
        activeColor: const Color(0xFFF40057),
        title: Text(key.toString()),
        value: value,
        groupValue: _selectedRadio,
        onChanged: (Sort newValue) {
          setState(() {
            _selectedRadio = newValue;
          });
        },
      );
      radioList.add(newRadio);
    });
    return radioList;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Sort by'),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: getRadios(dialogOptions),
        ),
      ],
    );
  }
}
