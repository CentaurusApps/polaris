import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:riverpod/riverpod.dart';

/// The type of the order in which habits are sorted.
enum SortType { name, score, dueDate, manually }

// The order in which habits are sorted.
class SortOrder with EquatableMixin {
  const SortOrder({@required this.sortType, @required this.reversed});

  final SortType sortType;

  final bool reversed;

  @override
  List<Object> get props => [sortType, reversed];
}

final sortOrderProvider = StateProvider((ref) => SortOrder(
      sortType: SortType.score,
      reversed: false,
    ));
