import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      // Left Image/Icon
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFF2563EB).withOpacity(0.8),
                                  const Color(0xFF1E40AF).withOpacity(0.9),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.airplanemode_active,
                                size: 100,
                                color: Colors.white,
                              ),
                              // Or use image:
                              // child: Image.asset('assets/images/drone.png', fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),

                      // Center Content
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // About Us Title
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  children: [
                                    const TextSpan(text: 'About '),
                                    TextSpan(
                                      text: 'Us',
                                      style: TextStyle(
                                        color: Colors.amber[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),

                              // Description Text
                              const Text(
                                'Your trusted source for professional drone repair services.\n'
                                'We offer expert maintenance, diagnostics, and emergency repair solutions using cutting-edge drone technology.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  height: 1.6,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Learn More Button
                              ElevatedButton(
                                onPressed: () {
                                  _launchURL('https://skyfix.com/learn-more');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF22C55E),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 8,
                                  shadowColor: const Color(0xFF22C55E).withOpacity(0.4),
                                ),
                                child: const Text(
                                  'Learn More',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Right Icon/Image
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color(0xFF1E40AF).withOpacity(0.8),
                                  const Color(0xFF2563EB).withOpacity(0.9),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.build,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Social Media Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Follow Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialMediaButton(
                        icon: FontAwesomeIcons.instagram,
                        color: const Color(0xFFE1306C),
                        onPressed: () => _launchURL('https://instagram.com/skyfix'),
                      ),
                      const SizedBox(width: 20),
                      _buildSocialMediaButton(
                        icon: FontAwesomeIcons.linkedinIn,
                        color: const Color(0xFF0077B5),
                        onPressed: () => _launchURL('https://linkedin.com/company/skyfix'),
                      ),
                      const SizedBox(width: 20),
                      _buildSocialMediaButton(
                        icon: FontAwesomeIcons.twitter,
                        color: const Color(0xFF1DA1F2),
                        onPressed: () => _launchURL('https://twitter.com/skyfix'),
                      ),
                      const SizedBox(width: 20),
                      _buildSocialMediaButton(
                        icon: FontAwesomeIcons.facebook,
                        color: const Color(0xFF1877F2),
                        onPressed: () => _launchURL('https://facebook.com/skyfix'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildSocialMediaButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: FaIcon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
