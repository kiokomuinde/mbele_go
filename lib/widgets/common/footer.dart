import 'package:flutter/material.dart';
import 'package:mbele_go/theme/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    // Premium Look: Dark background (MbeleColors.textDark) with vibrant accents
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      width: double.infinity,
      color: MbeleColors.textDark, // Deep, premium dark background
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // 1. MAIN LINK COLUMNS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column 1: Branding & Mission
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_car_filled, color: MbeleColors.primaryOrange, size: 30),
                            const SizedBox(width: 8),
                            const Text(
                              'MbeleGo Cars', 
                              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Your trusted marketplace for verified vehicles across Kenya. Driving the future of East African motoring.',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  
                  // Column 2: Buy Links
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Buy', style: TextStyle(color: MbeleColors.accentYellow, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      _FooterLink(text: 'All Listings'),
                      _FooterLink(text: 'Financing Options'),
                      _FooterLink(text: 'Certified Pre-Owned'),
                      _FooterLink(text: 'Dealer Directory'),
                    ],
                  ),
                  
                  // Column 3: Sell & Company
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Company', style: TextStyle(color: MbeleColors.accentYellow, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      _FooterLink(text: 'Sell My Car'),
                      _FooterLink(text: 'About Us'),
                      _FooterLink(text: 'Careers'),
                      _FooterLink(text: 'Client Stories'),
                    ],
                  ),

                  // Column 4: Contact & Legal
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Support & Legal', style: TextStyle(color: MbeleColors.accentYellow, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      _FooterLink(text: 'Contact Us'),
                      _FooterLink(text: 'Terms of Service'),
                      _FooterLink(text: 'Privacy Policy'),
                      _FooterLink(text: 'Report an Issue'),
                    ],
                  ),
                ],
              ),

              // 2. DIVIDER
              const Divider(color: MbeleColors.primaryOrange, height: 80, thickness: 1),

              // 3. COPYRIGHT & SOCIALS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '© 2025 MbeleGo Cars Ltd. | All rights reserved.',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  Row(
                    children: [
                      // Social Media Icons using HighlightPink for pop
                      IconButton(icon: Icon(Icons.facebook, color: MbeleColors.highlightPink), onPressed: () {}),
                      IconButton(icon: Icon(Icons.share, color: MbeleColors.highlightPink), onPressed: () {}), // Using share icon as placeholder for X/Twitter
                      IconButton(icon: Icon(Icons.camera_alt, color: MbeleColors.highlightPink), onPressed: () {}), // Placeholder for Instagram
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0), // Increased padding for better spacing
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, 
          fontSize: 16, 
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}