import 'package:flutter/material.dart';
import 'package:mbele_go/theme/colors.dart';

// Dummy data for featured vehicles - EXPANDED CONTENT
final List<Map<String, dynamic>> featuredCars = const [
  {'model': 'Toyota Probox 2018', 'price': 'Ksh 950,000', 'mileage': '120k KM', 'year': 2018, 'icon': Icons.local_shipping, 'desc': 'Perfect for business logistics or family trips. Fuel efficient.'},
  // FIX 1: Changed Icons.sports_car to the similar and safer Icons.sports_score
  {'model': 'Subaru Legacy GT', 'price': 'Ksh 1,450,000', 'mileage': '80k KM', 'year': 2021, 'icon': Icons.sports_score, 'desc': 'Turbocharged engine, full service history. Pristine condition.'},
  {'model': 'Matatu 33-Seater', 'price': 'Ksh 3,800,000', 'mileage': 'New', 'year': 2024, 'icon': Icons.directions_bus, 'desc': 'Brand new body on chassis. Ready for PSV licensing in Nairobi.'},
  {'model': 'Isuzu D-Max 4x4', 'price': 'Ksh 2,800,000', 'mileage': '45k KM', 'year': 2020, 'icon': Icons.airport_shuttle, 'desc': 'Rugged off-road capability for upcountry trips and heavy loads.'},
  {'model': 'Honda CRV 2015', 'price': 'Ksh 1,550,000', 'mileage': '70k KM', 'year': 2015, 'icon': Icons.drive_eta, 'desc': 'Compact SUV, perfect city commuter with high ground clearance.'},
  {'model': 'Mercedes C200', 'price': 'Ksh 4,200,000', 'mileage': '25k KM', 'year': 2022, 'icon': Icons.local_car_wash, 'desc': 'Luxury saloon, imported directly. Executive status.'},
];

class ListingsSection extends StatelessWidget {
  final bool isDesktop;
  const ListingsSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20, vertical: 60),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🔥 Top Verified Listings: Start Your Journey Mbele',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: MbeleColors.textDark,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Hand-picked, inspected, and priced to move. No hidden fees, just great cars.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          // Grid layout for car cards
          GridView.builder(
            shrinkWrap: true,
            // FIX 2: Corrected the typo in physics class name
            physics: const NeverScrollableScrollPhysics(), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 3 : 2, // 3 columns for desktop
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: isDesktop ? 0.8 : 0.7, // Better aspect ratio for desktop cards
            ),
            itemCount: featuredCars.length,
            itemBuilder: (context, index) {
              final car = featuredCars[index];
              return _CarCard(car: car);
            },
          ),
          const SizedBox(height: 50),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to the full search/listing page
              },
              icon: const Icon(Icons.arrow_right_alt, size: 28),
              label: const Text('View All 15,000+ Listings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: MbeleColors.primaryOrange,
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CarCard extends StatelessWidget {
  final Map<String, dynamic> car;
  const _CarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Placeholder
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: MbeleColors.backgroundLight.withOpacity(0.5),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Center(
              child: Icon(
                car['icon'] as IconData,
                size: 80,
                color: MbeleColors.highlightPink,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car['model'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: MbeleColors.textDark,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  car['desc'] as String,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  car['price'] as String,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: MbeleColors.highlightPink,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DetailChip(icon: Icons.calendar_today, label: '${car['year']}'),
                    _DetailChip(icon: Icons.speed, label: car['mileage'] as String),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      // Navigate to car detail page
                    },
                    child: const Text('View Details'),
                    style: FilledButton.styleFrom(
                      backgroundColor: MbeleColors.primaryOrange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _DetailChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: MbeleColors.primaryOrange),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}