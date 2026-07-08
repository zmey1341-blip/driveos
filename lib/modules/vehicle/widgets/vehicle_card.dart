import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vehicle_models.dart';

class VehicleCard extends ConsumerWidget {
  final Vehicle vehicle;
  final VoidCallback onSelect;

  const VehicleCard({
    Key? key,
    required this.vehicle,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onSelect,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${vehicle.make} ${vehicle.model}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Год: ${vehicle.year} | Пробег: ${vehicle.mileage} км',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '${vehicle.engine} | ${vehicle.transmission}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (vehicle.vehicleName != null) ...
                [
                  const SizedBox(height: 8),
                  Text(
                    'Имя: ${vehicle.vehicleName}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }
}
