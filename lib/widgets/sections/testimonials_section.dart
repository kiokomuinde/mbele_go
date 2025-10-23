import 'package:flutter/material.dart';
import 'package:mbele_go/theme/colors.dart';

class TestimonialsSection extends StatelessWidget {
  final bool isDesktop;
  const TestimonialsSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MbeleColors.backgroundLight.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Trusted by Thousands of Kenyan Buyers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: MbeleColors.textDark,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _TestimonialCard(
                quote: '“Found the perfect matatu within a week. The verification process gave me peace of mind.”',
                author: 'Juma K., Fleet Owner, Mombasa',
                icon: Icons.thumb_up_alt_outlined,
              ),
              _TestimonialCard(
                quote: '“The financing tools made my Probox purchase simple and affordable. MbeleGo moved me forward!”',
                author: 'Aisha N., Small Business Owner, Nairobi',
                icon: Icons.verified_user,
              ),
              _TestimonialCard(
                quote: '“Selling my old saloon was fast, transparent, and I got a great price. Highly recommended platform.”',
                author: 'David W., Private Seller, Kisumu',
                icon: Icons.flash_on,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String quote;
  final String author;
  final IconData icon;

  const _TestimonialCard({
    required this.quote,
    required this.author,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: MbeleColors.primaryOrange.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: MbeleColors.highlightPink.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MbeleColors.primaryOrange, size: 40),
          const SizedBox(height: 15),
          Text(
            quote,
            style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: MbeleColors.textDark,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '- $author',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MbeleColors.highlightPink,
            ),
          ),
        ],
      ),
    );
  }
}