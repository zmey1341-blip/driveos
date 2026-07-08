import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/vehicle/providers/vehicle_providers.dart';
import '../modules/vehicle/widgets/vehicle_card.dart';

class VehicleScreen extends ConsumerWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVehicle = ref.watch(currentVehicleProvider);
    final vehicles = ref.watch(vehiclesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой Автомобиль'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (currentVehicle != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${currentVehicle.make} ${currentVehicle.model}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 12),
                        Text('Год: ${currentVehicle.year}'),
                        Text('Пробег: ${currentVehicle.mileage} км'),
                        Text('Мотор: ${currentVehicle.engine}'),
                        Text('Коробка: ${currentVehicle.transmission}'),
                      ],
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Добавить автомобиль'),
                ),
              ),
            if (vehicles.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Другие автомобили',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    ...vehicles.map(
                      (vehicle) => VehicleCard(
                        vehicle: vehicle,
                        onSelect: () {},
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
