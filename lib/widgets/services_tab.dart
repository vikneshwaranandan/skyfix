import 'package:flutter/material.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Services',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.8,
            children: const [
              ServiceCard(
                title: 'Emergency Repairs',
                description: 'Quick fixes for breakdowns and urgent issues',
                icon: Icons.emergency,
                price: '\$99',
                backgroundImage: null,
                gradientColors: [Colors.red, Colors.redAccent],
              ),
              ServiceCard(
                title: 'Preventive Maintenance',
                description: 'Regular checkups to prevent future issues',
                icon: Icons.build_circle,
                price: '\$149',
                backgroundImage: 'assets/images/emergency.jpg',
              ),
              ServiceCard(
                title: 'Diagnostic Services',
                description: 'Comprehensive vehicle health assessment',
                icon: Icons.analytics,
                price: '\$79',
                backgroundImage: 'assets/images/diagnostics.jpg',
              ),
              ServiceCard(
                title: 'Fleet Management',
                description: 'Complete fleet monitoring and maintenance',
                icon: Icons.dark_mode,
                price: 'Custom',
                backgroundImage: 'assets/images/fleet.jpg',
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
  final String description;
  final IconData icon;
  final String price;
  final String? backgroundImage;
  final List<Color>? gradientColors;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.price,
    this.backgroundImage,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background Image or Gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: gradientColors != null
                      ? LinearGradient(
                          colors: gradientColors!,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  image: backgroundImage != null
                      ? DecorationImage(
                          image: AssetImage(backgroundImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            ),
            // Overlay for better text readability
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        size: 24,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text('Book Now', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 