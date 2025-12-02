import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoodies'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Text('Hoodies collection page', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
