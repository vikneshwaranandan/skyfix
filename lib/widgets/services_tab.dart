import 'package:flutter/material.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Services',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.85,
            children: const [
              ServiceCard(
                title: 'Break Down\nassistance',
                price: '\$89',
                icon: Icons.car_crash,
                color: Colors.blue,
                imageIcon: Icons.emergency,
              ),
              ServiceCard(
                title: 'Minor Repair\n(Single Panel)',
                price: '\$149',
                icon: Icons.build_circle,
                color: Colors.red,
                imageIcon: Icons.car_repair,
              ),
              ServiceCard(
                title: 'Periodical\nMaintenance',
                price: '\$199',
                icon: Icons.settings,
                color: Colors.orange,
                imageIcon: Icons.build,
              ),
              ServiceCard(
                title: 'Quick General\nCheckup',
                price: '\$79',
                icon: Icons.checklist,
                color: Colors.green,
                imageIcon: Icons.assignment_turned_in,
              ),
              ServiceCard(
                title: 'HVAC Operation',
                price: '\$129',
                icon: Icons.ac_unit,
                color: Colors.purple,
                imageIcon: Icons.air,
              ),
              ServiceCard(
                title: 'Interior Treatment',
                price: '\$99',
                icon: Icons.chair,
                color: Colors.brown,
                imageIcon: Icons.weekend,
              ),
              ServiceCard(
                title: 'Major Repair\n(Single Panel)',
                price: '\$299',
                icon: Icons.construction,
                color: Colors.indigo,
                imageIcon: Icons.engineering,
              ),
              ServiceCard(
                title: 'Full Body Paint',
                price: '\$899',
                icon: Icons.palette,
                color: Colors.teal,
                imageIcon: Icons.brush,
              ),
              ServiceCard(
                title: 'Vehicle Dynamic\nCheck',
                price: '\$159',
                icon: Icons.speed,
                color: Colors.cyan,
                imageIcon: Icons.tune,
              ),
              ServiceCard(
                title: 'Car Washing',
                price: '\$29',
                icon: Icons.local_car_wash,
                color: Colors.lightBlue,
                imageIcon: Icons.water_drop,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String price;
  final IconData icon;
  final Color color;
  final IconData imageIcon;

  const ServiceCard({
    super.key,
    required this.title,
    required this.price,
    required this.icon,
    required this.color,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D3748),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                // Background pattern
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.withOpacity(0.3),
                          color.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
                // Main icon
                Center(
                  child: Icon(
                    imageIcon,
                    size: 48,
                    color: color,
                  ),
                ),
                // Small service icon in top-right
                Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(
                    icon,
                    size: 20,
                    color: color.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          // Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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