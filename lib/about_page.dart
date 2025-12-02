import 'package:flutter/material.dart';
import 'package:union_shop/app_header.dart';
import 'package:union_shop/app_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content:
          Text('Feature coming soon — visit shop.upsu.net for full service'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppHeader(
              onLogoTap: () => navigateToHome(context),
              onButtonPressed: () => placeholderCallbackForButtons(context),
            ),

            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'About the Union Shop',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "The Union Shop provides essential study supplies and official Students' Union merchandise to support campus life. We stock stationery, course materials, branded clothing, and city souvenirs.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Services',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Click & collect, online ordering, and in-store purchases. Student discounts apply to selected items and we run seasonal promotions throughout the year.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Opening times & contact',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Open Mon–Fri 9:00–17:00. For enquiries email info@upsu.net or visit shop.upsu.net for full store information and latest offers.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),

            // Footer (reused style)
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
