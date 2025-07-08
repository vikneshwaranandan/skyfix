import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/home_tab.dart';
import 'widgets/services_tab.dart';
import 'widgets/analytics_tab.dart';
import 'widgets/login_panel.dart';

void main() {
  runApp(const SkyFixApp());
}

class SkyFixApp extends StatelessWidget {
  const SkyFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyFix - Drone Vehicle Repair',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF60A5FA),
          brightness: Brightness.dark,
        ).copyWith(
          background: const Color(0xFF121212),
          surface: const Color(0xFF1E1E1E),
          primary: const Color(0xFF60A5FA),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 1,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const SkyFixHomePage(),
    );
  }
}

class SkyFixHomePage extends StatefulWidget {
  const SkyFixHomePage({super.key});

  @override
  State<SkyFixHomePage> createState() => _SkyFixHomePageState();
}

class _SkyFixHomePageState extends State<SkyFixHomePage> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _whySkyFixKey = GlobalKey();
  bool _isLoginPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.accessibility_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
            const SizedBox(width: 12),
            const Text(
              'SkyFix',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 48),
            // Navigation items
            _buildNavItem('Home', 0),
            _buildScrollNavItem('Why SkyFix'),
            _buildNavItem('Services', 1),
            _buildNavItem('Analytics', 2),
          ],
        ),
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 1,
        actions: [
          TextButton(
            onPressed: _showLoginPanel,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Get Started'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              HomeTab(scrollController: _scrollController, whySkyFixKey: _whySkyFixKey),
              const ServicesTab(),
              const AnalyticsTab(),
            ],
          ),
          LoginPanel(
            isVisible: _isLoginPanelVisible,
            onClose: _hideLoginPanel,
          ),
        ],
      ),

    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToWhySkyFix() {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
    }
    
    // Wait for the page to switch, then scroll
    Future.delayed(const Duration(milliseconds: 100), () {
      final context = _whySkyFixKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _showLoginPanel() {
    setState(() {
      _isLoginPanelVisible = true;
    });
  }

  void _hideLoginPanel() {
    setState(() {
      _isLoginPanelVisible = false;
    });
  }

  Widget _buildScrollNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: _scrollToWhySkyFix,
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    final isSelected = _selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        style: TextButton.styleFrom(
          foregroundColor: isSelected 
              ? Theme.of(context).colorScheme.primary 
              : Colors.grey[300],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
