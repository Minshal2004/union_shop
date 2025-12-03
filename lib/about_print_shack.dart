import 'package:flutter/material.dart';

class AboutPrintShackPage extends StatelessWidget {
  const AboutPrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Print Shack Personalisation'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('How Print Shack Personalisation works',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(
                '1) Choose an item: Select the product you want to personalise (e.g. T‑Shirt, Hoodie, Mug, Cap).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '2) Enter your custom text: Provide the text you want printed. Keep within the character limit shown on the form.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '3) Select options: For clothing choose a size; for mugs choose a colour. Some items may offer additional placement or style choices.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '4) Live preview: A simple preview displays your selected item and text to help you confirm before adding to cart.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '5) Add to cart and checkout: Once satisfied, add the personalised item to your cart and complete checkout. Production and dispatch times are shown on the product page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text('Important information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                '• Character limits: Some items limit the number of characters for legibility. The form enforces these limits.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                '• Approvals and artwork: Handwritten logos or complex artwork may require manual review; we will contact you if changes are needed.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                '• Production times: Personalised items typically take longer than standard items. Estimated lead times are shown on the product page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text('Need help?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                'If you need assistance with personalisation options or have a specific request, contact our Print Shack team at printshack@union.example or visit our helpdesk.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text('Thank you for choosing Print Shack',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
