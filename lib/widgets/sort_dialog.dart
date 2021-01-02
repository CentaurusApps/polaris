import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/sort_type.dart';

class SortDialog extends ConsumerWidget {
  static const _dialogOptions = {
    'My order': SortType.manually,
    'Score': SortType.score,
    'Date': SortType.dueDate,
    'Name': SortType.name,
  };

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final sortType = watch(sortTypeProvider);

    final radios = [
      for (final entry in _dialogOptions.entries)
        RadioListTile<SortType>(
          activeColor: Theme.of(context).accentColor,
          title: Text(entry.key.toString()),
          value: entry.value,
          groupValue: sortType.state,
          onChanged: (newValue) {
            sortType.state = newValue;
            Navigator.pop(context);
          },
        )
    ];

    return SimpleDialog(
      title: const Text('Sort by'),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: radios,
        ),
      ],
    );
  }
}
