import 'package:flutter/material.dart';
import '../models/product.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo'),
      ),
      body: Column(children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ]),
    );
  }
}
