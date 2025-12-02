import 'package:flutter/material.dart';

/// Reusable footer for the Union Shop app.
/// Shows three simple static sections: Customer Service, Information and Social Media.
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    );

    final linkStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey[700],
    );

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 600;

          Widget section(String title, List<String> lines) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: headingStyle),
                const SizedBox(height: 8),
                for (final l in lines)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(l, style: linkStyle),
                  ),
              ],
            );
          }

          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                section('Customer Service', [
                  'Contact us: info@upsu.net',
                  'Returns & refunds',
                  'FAQ',
                ]),
                const SizedBox(height: 20),
                section('Information', [
                  'About the Union Shop',
                  'Delivery & collection',
                  'Terms & conditions',
                ]),
                const SizedBox(height: 20),
                section('Social Media', [
                  'Twitter: @UniUnion',
                  'Facebook: /UnionShop',
                  'Instagram: @unionshop',
                ]),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: section('Customer Service', [
                  'Contact us: info@upsu.net',
                  'Returns & refunds',
                  'FAQ',
                ]),
              ),
              Expanded(
                child: section('Information', [
                  'About the Union Shop',
                  'Delivery & collection',
                  'Terms & conditions',
                ]),
              ),
              Expanded(
                child: section('Social Media', [
                  'Twitter: @UniUnion',
                  'Facebook: /UnionShop',
                  'Instagram: @unionshop',
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
