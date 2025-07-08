import 'package:flutter/material.dart';

class FleetTab extends StatelessWidget {
  const FleetTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Drone Fleet',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: const [
              DroneCard(
                name: 'SkyFix Pro',
                status: 'Available',
                battery: '85%',
                location: 'Zone A',
              ),
              DroneCard(
                name: 'SkyFix Elite',
                status: 'In Service',
                battery: '92%',
                location: 'Zone B',
              ),
              DroneCard(
                name: 'SkyFix Max',
                status: 'Maintenance',
                battery: '45%',
                location: 'Hangar',
              ),
              DroneCard(
                name: 'SkyFix Ultra',
                status: 'Available',
                battery: '78%',
                location: 'Zone C',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DroneCard extends StatelessWidget {
  final String name;
  final String status;
  final String battery;
  final String location;

  const DroneCard({
    super.key,
    required this.name,
    required this.status,
    required this.battery,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'Available':
        statusColor = Colors.green;
        break;
      case 'In Service':
        statusColor = Colors.orange;
        break;
      case 'Maintenance':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.dark_mode,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.battery_charging_full, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                battery,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                location,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 