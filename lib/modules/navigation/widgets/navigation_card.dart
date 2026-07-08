import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationCard extends ConsumerWidget {
  final String destination;
  final String distance;
  final String time;
  final VoidCallback onStart;

  const NavigationCard({
    Key? key,
    required this.destination,
    required this.distance,
    required this.time,
    required this.onStart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 8),
                Text(distance),
                const SizedBox(width: 24),
                const Icon(Icons.schedule, size: 16),
                const SizedBox(width: 8),
                Text(time),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onStart,
              child: const Text('Начать навигацию'),
            ),
          ],
        ),
      ),
    );
  }
}
