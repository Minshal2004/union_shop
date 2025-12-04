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
    final screenWidth = MediaQuery.of(context).size.width;
    // Responsive max width: full width on small screens, 90% on medium,
    // and capped width on large screens for comfortable reading line-length.
    final maxContentWidth = screenWidth < 600
        ? double.infinity
        : (screenWidth < 1000 ? screenWidth * 0.9 : 900.0);
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
                    maxWidth: maxContentWidth,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 24, vertical: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Heading
                        Text(
                          'About the Union Shop',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: isMobile ? 24 : 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: isMobile ? 12 : 16),

                        // Lead paragraph
                        Text(
                          'The official Students\' Union store — campus essentials, course supplies and official merch. Shop online or collect in-store at the Students\' Union.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey[800], height: 1.5),
                        ),
                        SizedBox(height: isMobile ? 20 : 28),

                        // Constrained body for comfortable reading on desktop
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 720),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Our mission', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 8),
                              Text(
                                'We provide affordable, reliable supplies and official University merchandise to support student life. From stationery and course materials to branded clothing and city souvenirs, our aim is to make campus life easier and more connected.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16, height: 1.6, color: Colors.grey[800]),
                              ),
                              const SizedBox(height: 16),
                              Text('Visit us', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 8),
                              Text(
                                'Visit shop.upsu.net for full online shopping, or call in to our campus store Mon–Fri 9:00–17:00. For enquiries email info@upsu.net.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 16, height: 1.6, color: Colors.grey[800]),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: TextButton(
                                  onPressed: () => Navigator.pushNamed(context, '/collections'),
                                  child: const Text('Browse Collections', style: TextStyle(letterSpacing: 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: isMobile ? 32 : 48),
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
