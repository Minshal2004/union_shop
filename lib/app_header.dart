import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onButtonPressed;

  const AppHeader(
      {super.key, required this.onLogoTap, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'NEW TERM STOCK — University essentials and branded merch available now. Free click & collect for students. Visit shop.upsu.net for opening times and offers.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // Main header
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: onLogoTap,
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  // Navigation links for wider screens
                  Builder(builder: (context) {
                    // Only show text navigation on desktop / wide layouts
                    final isWide = MediaQuery.of(context).size.width > 800;
                    if (!isWide) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/'),
                            child: const Text('Home'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/about'),
                            child: const Text('About'),
                          ),
                          TextButton(
                            onPressed: onButtonPressed,
                            child: const Text('Collections'),
                          ),
                          TextButton(
                            onPressed: onButtonPressed,
                            child: const Text('Sale'),
                          ),
                          TextButton(
                            onPressed: onButtonPressed,
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                    );
                  }),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Tooltip(
                          message: 'Search products',
                          child: IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: onButtonPressed,
                          ),
                        ),
                        Tooltip(
                          message: 'Your account',
                          child: IconButton(
                            icon: const Icon(
                              Icons.person_outline,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: onButtonPressed,
                          ),
                        ),
                        Tooltip(
                          message: 'View basket',
                          child: IconButton(
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: onButtonPressed,
                          ),
                        ),
                        Tooltip(
                          message: 'Open menu',
                          child: IconButton(
                            icon: const Icon(
                              Icons.menu,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: onButtonPressed,
                          ),
                        ),
                        Tooltip(
                          message: 'About',
                          child: IconButton(
                            icon: const Icon(
                              Icons.info_outline,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/about'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
