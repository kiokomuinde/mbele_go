import 'package:flutter/material.dart';
import 'package:mbele_go/widgets/common/custom_navbar.dart';
import 'package:mbele_go/widgets/common/footer.dart';
import 'package:mbele_go/widgets/sections/listings_section.dart';
import 'package:mbele_go/theme/colors.dart';

class MbeleGoHomeScreen extends StatelessWidget {
  const MbeleGoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;
        
        return Scaffold(
          appBar: CustomNavbar(isDesktop: isDesktop), 
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 1. HERO SECTION
                _buildHeroSection(context, isDesktop),
                
                // 2. TRUST/VALUE PROPOSITIONS
                _buildValuePropositionSection(isDesktop),
                
                // 3. FEATURED LISTINGS
                const SizedBox(height: 80),
                ListingsSection(isDesktop: isDesktop), 
                
                // 4. CALL TO ACTION (MOVED UP)
                const SizedBox(height: 80),
                _buildCallToActionSection(context),
                
                // 5. TESTIMONIALS (MOVED DOWN)
                const SizedBox(height: 80), 
                _buildTestimonialsSection(isDesktop),
                
                const SizedBox(height: 0),
                
                // 6. Modular Footer
                const Footer(), 
              ],
            ),
          ),
        );
      },
    );
  }

  // --- 1. HERO SECTION WIDGET ---
  Widget _buildHeroSection(BuildContext context, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 20,
        vertical: isDesktop ? 80 : 40,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MbeleColors.accentYellow,
            MbeleColors.primaryOrange,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Your Next Ride is Mbele (Ahead).',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 60 : 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Kenya\'s widest and most trusted marketplace for verified cars, trucks, and PSVs. Search, finance, and drive—all in one place.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 22 : 16,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          _buildSearchBar(isDesktop),
          const SizedBox(height: 40),
          Icon(
            Icons.directions_bus_filled, 
            size: isDesktop ? 150 : 100,
            color: MbeleColors.highlightPink.withOpacity(0.9),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isDesktop) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by Make, Model, or Budget (e.g., Toyota Probox)',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('Search'),
            style: ElevatedButton.styleFrom(
              backgroundColor: MbeleColors.highlightPink,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: isDesktop ? 20 : 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }

  // --- 2. VALUE PROPOSITION WIDGET ---
  Widget _buildValuePropositionSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20, vertical: 60),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        children: [
          const Text(
            'Why MbeleGo is Kenya\'s Best Choice',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: MbeleColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: const [ // Now safe to be const because children are top-level classes
              _ValueCard(
                icon: Icons.shield,
                title: 'Vehicle Verification',
                description: 'Every car listed undergoes a 150-point inspection and KRA/NTSA record check. Buy with 100% confidence, knowing the history.',
                color: MbeleColors.highlightPink,
              ),
              _ValueCard(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Seamless Financing',
                description: 'Integrated pre-approval tools allow you to calculate payments and apply for financing instantly through our banking partners.',
                color: MbeleColors.primaryOrange,
              ),
              _ValueCard(
                icon: Icons.local_shipping,
                title: 'Logistics Made Easy',
                description: 'Need a vehicle delivered upcountry? We coordinate safe, insured transport directly to your town, whether it\'s Kisumu or Mombasa.',
                color: MbeleColors.accentYellow,
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Divider(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [ 
              _FeatureStat(icon: Icons.verified, number: '150+', label: 'Verified Inspection Points'),
              _FeatureStat(icon: Icons.local_car_wash, number: '15,000+', label: 'Active Listings Across Kenya'),
              _FeatureStat(icon: Icons.payments, number: '30+', label: 'Financing Partners Integrated'),
            ],
          )
        ],
      ),
    );
  }

  // --- 3. CALL TO ACTION WIDGET ---
  Widget _buildCallToActionSection(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      constraints: const BoxConstraints(maxWidth: 1200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            MbeleColors.highlightPink,
            MbeleColors.primaryOrange,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: MbeleColors.highlightPink.withOpacity(0.4),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Ready to Find Your Dream Car?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Browse thousands of listings or use our secure portal to list your own vehicle today.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search, size: 26),
                label: const Text(
                  'Start Browsing',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MbeleColors.accentYellow,
                  foregroundColor: MbeleColors.textDark,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
              ),
              const SizedBox(width: 20),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_box, size: 26, color: Colors.white),
                label: const Text(
                  'List Your Vehicle',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 4. TESTIMONIALS WIDGET ---
  Widget _buildTestimonialsSection(bool isDesktop) {
    return Container(
      width: double.infinity,
      color: MbeleColors.backgroundLight.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20, vertical: 80),
      child: Column(
        children: [
          const Text(
            'Real People. Real Rides. Real Trust.',
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
            children: const [ 
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
} // <--- END OF MbeleGoHomeScreen CLASS

// --- REUSABLE WIDGETS MOVED TO TOP-LEVEL ---

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ValueCard({
    super.key, // Added super.key to constructors
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.15),
            ),
            child: Icon(icon, color: color, size: 35),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: MbeleColors.textDark,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: MbeleColors.textDark.withOpacity(0.7),
            ),
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
    super.key, // Added super.key
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

class _FeatureStat extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;

  const _FeatureStat({
    super.key, // Added super.key
    required this.icon, 
    required this.number, 
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: MbeleColors.highlightPink),
        const SizedBox(height: 5),
        Text(
          number,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: MbeleColors.textDark),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}