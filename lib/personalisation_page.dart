import 'package:flutter/material.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Shack Personalisation'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Text('Personalisation tools coming soon'),
      ),
    );
  }
}
