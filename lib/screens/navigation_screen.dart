import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/navigation/providers/navigation_providers.dart';
import '../modules/navigation/widgets/navigation_card.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = ref.watch(currentRouteProvider);
    final isNavigating = ref.watch(isNavigatingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Навигация'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isNavigating && currentRoute != null)
              Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Маршрут активен',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Text(currentRoute.name),
                    ],
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Выберите пункт назначения',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            // Recent destinations
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Последние места',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  // Placeholder for recent routes
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Нет недавних маршрутов'),
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
