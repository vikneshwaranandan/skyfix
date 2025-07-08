import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatelessWidget {
  final ScrollController? scrollController;
  final GlobalKey? whySkyFixKey;

  const HomeTab({super.key, this.scrollController, this.whySkyFixKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(80),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1E3A8A),
                  const Color(0xFF3B82F6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'SkyFix: The Future of Roadside Assistance Is in the Sky',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Stranded? Broken down? Out of fuel?\nSkyFix deploys drones to fix your car — fast, smart, and from the sky.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'No waiting. No towing. No panic. Just press a button and help arrives via drone, often in under 15 minutes.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white60,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse('http://skyfix.dev.fyre.ibm.com:8000/');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get Started Now',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 24),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Watch Demo',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // What is SkyFix Section
          Container(
            padding: const EdgeInsets.all(80),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'What Is SkyFix?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'SkyFix is a drone-powered vehicle repair and roadside assistance service that brings repair tools and parts directly to your car — wherever you are. Whether you\'re in the city or off the grid, our intelligent repair drones get you moving again without the hassle of calling a tow truck or waiting for hours.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // How It Works Section
          Container(
            padding: const EdgeInsets.all(80),
            color: Colors.grey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'How It Works',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStep('1', 'Subscribe', 'Subscribe to the SkyFix app and get 24/7 coverage.', Icons.phone_android),
                    _buildStep('2', 'Request Help', 'Press the SOS button when you need help.', Icons.sos),
                    _buildStep('3', 'Describe Issue', 'Describe using voice, text, or live chat.', Icons.chat),
                    _buildStep('4', 'Drone Dispatch', 'SkyFix AI dispatches a specialized drone.', Icons.flight_takeoff),
                    _buildStep('5', 'Repair', 'Drone performs repair or assists self-repair.', Icons.build),
                    _buildStep('6', 'Back on Road', 'You\'re back on the road — stress-free!', Icons.directions_car),
                  ],
                ),
              ],
            ),
          ),

          // Specialized Drones Section
          Container(
            padding: const EdgeInsets.all(80),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Our Specialized Drones Can Handle:',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 48),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.2,
                  children: [
                    _buildServiceCard('Dead Battery', 'Drone jump-starts your car or drops off a replacement battery.', Icons.battery_charging_full, Colors.green),
                    _buildServiceCard('Flat Tire', 'Equipped with pumps to re-inflate, or delivers a compact spare.', Icons.tire_repair, Colors.blue),
                    _buildServiceCard('Smashed Window', 'Covers your broken window with weatherproof seal.', Icons.window, Colors.orange),
                    _buildServiceCard('Out of Fuel', 'Drone brings enough fuel to get you to the next station.', Icons.local_gas_station, Colors.red),
                    _buildServiceCard('Lost Keys', 'Smart-lock override assistance or key replacement dispatch.', Icons.key, Colors.purple),
                    _buildServiceCard('Component Delivery', 'Need a new belt? Spark plug? Drone drops it to your hood.', Icons.precision_manufacturing, Colors.teal),
                    _buildServiceCard('Low Oil or Coolant', 'Drone replenishes oil or water to get your engine safe again.', Icons.oil_barrel, Colors.amber),
                    _buildServiceCard('Vehicle Health Check', 'Drone performs diagnostics, shares report in your app.', Icons.health_and_safety, Colors.cyan),
                    _buildServiceCard('Accident Reporting', 'Drone captures on-site images, evidence, and location data.', Icons.report_problem, Colors.pink),
                  ],
                ),
              ],
            ),
          ),

          // Why SkyFix Section
          Container(
            key: whySkyFixKey,
            padding: const EdgeInsets.all(80),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange[400]!,
                  Colors.orange[600]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Why SkyFix?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildWhyCard('Lightning-Fast Response', 'Average drone dispatch time: < 15 minutes.', Icons.flash_on),
                    _buildWhyCard('AI-Powered Precision', 'Smart AI assesses the problem and sends the right drone.', Icons.smart_toy),
                    _buildWhyCard('Anywhere You Are', 'City or remote road, SkyFix drones can reach you via GPS.', Icons.location_on),
                    _buildWhyCard('Reliable & Secure', 'Encrypted communications, tracked repairs, seamless payment.', Icons.security),
                    _buildWhyCard('Constantly Learning', 'Our AI and drones get smarter with every repair.', Icons.psychology),
                  ],
                ),
              ],
            ),
          ),

          // Subscription Plans Section
          Container(
            padding: const EdgeInsets.all(80),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Subscription Plans',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Choose the right plan for your driving habits.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPlanCard('SkyFix Lite', '\$29/month', [
                      '3 drone callouts/month',
                      'Basic diagnostics & fuel/battery support',
                    ], false),
                    const SizedBox(width: 24),
                    _buildPlanCard('SkyFix Plus', '\$59/month', [
                      'Unlimited drone SOS events',
                      'Priority response time',
                      'Advanced repair options',
                    ], true),
                    const SizedBox(width: 24),
                    _buildPlanCard('SkyFix Pro', '\$99/month', [
                      'Includes on-demand human mechanic support',
                      'Commercial/fleet-ready',
                      'Real-time tracking dashboard',
                    ], false),
                  ],
                ),
              ],
            ),
          ),

          // Get Started Section
          Container(
            padding: const EdgeInsets.all(80),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1E3A8A),
                  const Color(0xFF3B82F6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Join the roadside revolution.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse('http://skyfix.dev.fyre.ibm.com:8000/');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Download for iOS',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse('http://skyfix.dev.fyre.ibm.com:8000/');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Download for Android',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'SkyFix — Roadside Rescue from the Sky\nBecause being stranded shouldn\'t mean being stuck.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white60,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(String number, String title, String description, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[600],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 16),
          Text(
            number,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildWhyCard(String title, String description, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(String title, String price, List<String> features, bool isPopular) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isPopular ? Colors.blue[600] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? Colors.blue[600]! : Colors.grey[300]!,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'POPULAR',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isPopular ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isPopular ? Colors.white : Colors.blue[600],
            ),
          ),
          const SizedBox(height: 24),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: isPopular ? Colors.white : Colors.green,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    feature,
                    style: TextStyle(
                      fontSize: 14,
                      color: isPopular ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              final url = Uri.parse('http://skyfix.dev.fyre.ibm.com:8000/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isPopular ? Colors.orange : Colors.blue[600],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Choose Plan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
} 