import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/dashcam/providers/dashcam_providers.dart';

class DashCamScreen extends ConsumerWidget {
  const DashCamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = ref.watch(dashCamRecordingProvider);
    final events = ref.watch(dashCamEventsProvider);
    final recordings = ref.watch(dashCamRecordingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Видеорегистратор'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Recording status
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isRecording ? Colors.red : Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isRecording ? 'ЗАПИСЬ ВЕДЕТСЯ' : 'ЗАПИСЬ ОСТАНОВЛЕНА',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          isRecording ? 'Остановить' : 'Начать',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Events
            if (events.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'События (${events.length})',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    ...events.map(
                      (event) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(event.type),
                        ),
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
