import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNavigator extends ConsumerWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: 'Главная',
            ),
            Tab(
              icon: Icon(Icons.navigation),
              text: 'Навигация',
            ),
            Tab(
              icon: Icon(Icons.directions_car),
              text: 'Авто',
            ),
            Tab(
              icon: Icon(Icons.videocam),
              text: 'Видео',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'Настройки',
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            _HomeView(),
            _NavigationView(),
            _VehicleView(),
            _DashCamView(),
            _SettingsView(),
          ],
        ),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }
}

class _NavigationView extends StatelessWidget {
  const _NavigationView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Navigation'));
  }
}

class _VehicleView extends StatelessWidget {
  const _VehicleView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Vehicle'));
  }
}

class _DashCamView extends StatelessWidget {
  const _DashCamView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('DashCam'));
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings'));
  }
}
