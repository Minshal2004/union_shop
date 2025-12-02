import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoodies Collection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hoodies Collection',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page
              },
              child: const Text('Explore More'),
            ),
          ],
        ),
      ),
    );
  }
}
