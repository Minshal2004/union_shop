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
    final isMobile = MediaQuery.of(context).size.width < 600;
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
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 900,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 24, vertical: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Centered page heading
                        Text(
                          'About the Union Shop',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),

                        // Main content in a clean left-aligned column, but use
                        // justified text for tidy edges within the constrained width.
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Union Shop provides essential study supplies and official Students' Union merchandise to support campus life. We stock stationery, course materials, branded clothing, and city souvenirs.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Services',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Click & collect, online ordering, and in-store purchases. Student discounts apply to selected items and we run seasonal promotions throughout the year.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Opening times & contact',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Open Mon–Fri 9:00–17:00. For enquiries email info@upsu.net or visit shop.upsu.net for full store information and latest offers.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // extra spacing before footer
            SizedBox(height: isMobile ? 24 : 48),

            // Footer (reused style)
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
