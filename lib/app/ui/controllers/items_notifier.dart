import 'package:flutter_riverpod/flutter_riverpod.dart';

// Would use an immutable object realistically
class ItemsNotifier extends StateNotifier<List<String>> {
  ItemsNotifier() : super([]);

  void addItem(String item) {
    state = [...state, item];
  }
}
