import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/varvara/widgets/varvara_button.dart';
import '../modules/music/widgets/music_widget.dart';
import '../modules/navigation/widgets/navigation_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DriveOS'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Music Widget
            const Padding(
              padding: EdgeInsets.all(16),
              child: MusicWidget(
                track: null,
                isPlaying: false,
                onPlayPause: _onPlayPause,
                onNext: _onNext,
                onPrevious: _onPrevious,
              ),
            ),
            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickActionButton(
                    icon: Icons.navigation,
                    label: 'Навигация',
                    onPressed: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.settings,
                    label: 'Настройки',
                    onPressed: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.info,
                    label: 'Статус',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const VarvaraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  static void _onPlayPause() {}
  static void _onNext() {}
  static void _onPrevious() {}
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          mini: true,
          onPressed: onPressed,
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
