import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/music_models.dart';

final selectedMusicProviderProvider = StateProvider<MusicProvider>((ref) {
  return MusicProvider.yandexMusic;
});

final currentMusicTrackProvider = StateProvider<MusicTrack?>((ref) {
  return null;
});

final musicIsPlayingProvider = StateProvider<bool>((ref) {
  return false;
});

final currentPlaylistProvider = StateProvider<List<MusicTrack>>((ref) {
  return [];
});

final favoriteTracksProvider = FutureProvider((ref) async {
  return <MusicTrack>[];
});
