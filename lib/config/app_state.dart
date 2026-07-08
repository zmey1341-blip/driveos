import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = StateProvider<AppState>((ref) {
  return AppState.initial();
});

class AppState {
  final bool isInitialized;
  final bool isOnline;
  final bool isDarkMode;
  final String currentLanguage;

  AppState({
    required this.isInitialized,
    required this.isOnline,
    required this.isDarkMode,
    required this.currentLanguage,
  });

  factory AppState.initial() {
    return AppState(
      isInitialized: false,
      isOnline: true,
      isDarkMode: true,
      currentLanguage: 'ru',
    );
  }

  AppState copyWith({
    bool? isInitialized,
    bool? isOnline,
    bool? isDarkMode,
    String? currentLanguage,
  }) {
    return AppState(
      isInitialized: isInitialized ?? this.isInitialized,
      isOnline: isOnline ?? this.isOnline,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }
}
