import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/obd_models.dart';

class OBDDiagnosticWidget extends ConsumerWidget {
  final bool isConnected;
  final List<OBDError> errors;
  final VoidCallback onConnect;
  final VoidCallback onClearErrors;

  const OBDDiagnosticWidget({
    Key? key,
    required this.isConnected,
    required this.errors,
    required this.onConnect,
    required this.onClearErrors,
  }) : super(key: key);

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'critical':
        return Colors.red;
      case 'warning':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'OBD Диагностика',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isConnected ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isConnected ? 'Подключено' : 'Отключено',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (errors.isEmpty)
              const Text('Ошибок не найдено')
            else
              Column(
                children: errors
                    .map(
                      (error) => Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.left(
                            color: _getSeverityColor(error.severity),
                            width: 4,
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${error.code}: ${error.title}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(error.description),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConnect,
                    child: Text(isConnected ? 'Переподключить' : 'Подключить'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onClearErrors,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Очистить'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
