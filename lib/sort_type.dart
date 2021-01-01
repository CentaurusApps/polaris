import 'package:riverpod/riverpod.dart';

// TODO: allow reversing the order.
/// The order in which habits are sorted.
enum SortType { name, score, dueDate, manually }

final sortTypeProvider = StateProvider((ref) => SortType.score);
