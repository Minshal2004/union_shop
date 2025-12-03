// ...new file...
import 'package:flutter/material.dart';
import 'package:union_shop/services/cart_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    cartService.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    cartService.removeListener(_onCartChanged);
    super.dispose();
  }

  void _onCartChanged() => setState(() {});

  void _checkout() {
    if (cartService.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Your cart is empty.'),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    cartService.clear();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Checkout complete — thank you for your order.'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final items = cartService.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: items.isEmpty
                  ? const Center(child: Text('Your cart is empty.'))
                  : ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final ci = items[index];
                        return ListTile(
                          leading: ci.product.imageUrl.isNotEmpty
                              ? Image.network(ci.product.imageUrl,
                                  width: 56,
                                  height: 56,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                        color: Colors.grey[200],
                                        width: 56,
                                        height: 56,
                                      ))
                              : Container(
                                  color: Colors.grey[200],
                                  width: 56,
                                  height: 56),
                          title: Text(ci.product.title),
                          subtitle: Text(ci.product.price),
                          trailing: Text('x${ci.quantity}'),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: £${cartService.totalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16)),
                  ElevatedButton(
                    onPressed: _checkout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4d2963),
                    ),
                    child: const Text('Checkout'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
