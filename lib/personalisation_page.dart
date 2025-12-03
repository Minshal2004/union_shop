import 'package:flutter/material.dart';

class PersonalisationPage extends StatefulWidget {
  const PersonalisationPage({super.key});

  @override
  State<PersonalisationPage> createState() => _PersonalisationPageState();
}

class _PersonalisationPageState extends State<PersonalisationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _customTextController = TextEditingController();
  String? _selectedItem;

  final List<String> _itemTypes = ['T‑Shirt', 'Mug', 'Hoodie', 'Cap'];

  @override
  void dispose() {
    _customTextController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final item = _selectedItem ?? '';
    final text = _customTextController.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Added personalisation: $item — "$text"'),
      duration: const Duration(seconds: 2),
    ));

    // Reset form
    setState(() {
      _selectedItem = null;
      _customTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Shack Personalisation'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedItem,
                decoration: const InputDecoration(labelText: 'Item type'),
                items: _itemTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedItem = v),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Please select an item' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _customTextController,
                decoration: const InputDecoration(labelText: 'Custom text'),
                maxLength: 30,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Enter text to personalise'
                    : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                    ),
                    child: const Text('Add personalisation'),
                  ),
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedItem = null;
                        _customTextController.clear();
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Preview',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _selectedItem == null && _customTextController.text.isEmpty
                        ? 'No personalisation selected'
                        : '${_selectedItem ?? ''} — ${_customTextController.text}',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
