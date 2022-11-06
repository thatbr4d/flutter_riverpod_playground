import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/providers.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> items = ref.watch(itemsProvider);
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            for (final item in items)
              ListTile(
                title: Text(item),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModal(context, ref, textController),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showModal(BuildContext context, WidgetRef ref, TextEditingController controller) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add Item",
            style: Theme.of(context).textTheme.headline6,
          ),
          const Divider(),
          TextField(
            controller: controller,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                ref.read(itemsProvider.notifier).addItem(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text("Add")),
          const SizedBox(height: 20),
        ],
      );
    },
  );
}
