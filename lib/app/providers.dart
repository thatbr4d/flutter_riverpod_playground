import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/ui/controllers/items_notifier.dart';

final itemsProvider = StateNotifierProvider<ItemsNotifier, List<String>>((ref) {
  return ItemsNotifier();
});
