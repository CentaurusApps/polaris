import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris_domain/entities/sort_order.dart';

class SortDialog extends ConsumerWidget {
  static const _dialogOptions = {
    'My order': SortType.manually,
    'Score': SortType.score,
    'Date': SortType.dueDate,
    'Name': SortType.name,
  };

  // TODO: add a reverse button or checkbox or whatever.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final sortOrder = watch(sortOrderProvider);

    final radios = [
      for (final entry in _dialogOptions.entries)
        RadioListTile<SortType>(
          //activeColor: Theme.of(context).accentColor,
          title: Text(entry.key.toString()),
          value: entry.value,
          groupValue: sortOrder.state.sortType,
          onChanged: (newValue) {
            sortOrder.state = SortOrder(
                sortType: newValue, reversed: sortOrder.state.reversed);
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
