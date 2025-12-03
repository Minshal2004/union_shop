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
  String? _selectedSize;
  String? _selectedMugColor;

  final List<String> _itemTypes = ['T‑Shirt', 'Mug', 'Hoodie', 'Cap'];
  final List<String> _sizes = ['S', 'M', 'L', 'XL'];
  final List<String> _mugColors = ['White', 'Black', 'Blue'];

  @override
  void dispose() {
    _customTextController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final item = _selectedItem ?? '';
    final text = _customTextController.text.trim();
    final extra = (item == 'T‑Shirt' || item == 'Hoodie')
        ? (_selectedSize != null ? ' size: $_selectedSize' : '')
        : (item == 'Mug'
            ? (_selectedMugColor != null ? ' color: $_selectedMugColor' : '')
            : '');

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Added personalisation: $item — "$text"$extra'),
      duration: const Duration(seconds: 2),
    ));

    // Reset form
    setState(() {
      _selectedItem = null;
      _selectedSize = null;
      _selectedMugColor = null;
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
                onChanged: (v) => setState(() {
                  _selectedItem = v;
                  // reset item-specific options when item changes
                  _selectedSize = null;
                  _selectedMugColor = null;
                }),
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
              const SizedBox(height: 12),

              // Conditional helper/options depending on selected item
              if (_selectedItem == 'T‑Shirt' || _selectedItem == 'Hoodie')
                DropdownButtonFormField<String>(
                  value: _selectedSize,
                  decoration: const InputDecoration(labelText: 'Size'),
                  items: _sizes
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedSize = v),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Select a size' : null,
                ),

              if (_selectedItem == 'Mug')
                DropdownButtonFormField<String>(
                  value: _selectedMugColor,
                  decoration: const InputDecoration(labelText: 'Mug color'),
                  items: _mugColors
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedMugColor = v),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Select a color' : null,
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
                        _selectedSize = null;
                        _selectedMugColor = null;
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
                        : '${_selectedItem ?? ''}${_selectedSize != null ? ' • Size: $_selectedSize' : ''}${_selectedMugColor != null ? ' • Color: $_selectedMugColor' : ''} — ${_customTextController.text}',
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
