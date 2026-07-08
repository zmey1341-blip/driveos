import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/obd/providers/obd_providers.dart';
import '../modules/obd/widgets/obd_diagnostic_widget.dart';

class DiagnosticsScreen extends ConsumerWidget {
  const DiagnosticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(obdConnectedProvider);
    final errors = ref.watch(obdErrorsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Диагностика'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: OBDDiagnosticWidget(
          isConnected: isConnected,
          errors: errors,
          onConnect: () {},
          onClearErrors: () {},
        ),
      ),
    );
  }
}
