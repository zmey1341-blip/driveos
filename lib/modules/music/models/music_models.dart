class MusicTrack {
  final String id;
  final String title;
  final String artist;
  final String album;
  final Duration duration;
  final String? imageUrl;
  final bool isFavorite;

  MusicTrack({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    this.imageUrl,
    required this.isFavorite,
  });
}

class MusicPlaylist {
  final String id;
  final String name;
  final List<MusicTrack> tracks;
  final String? imageUrl;
  final DateTime createdAt;

  MusicPlaylist({
    required this.id,
    required this.name,
    required this.tracks,
    this.imageUrl,
    required this.createdAt,
  });
}

enum MusicProvider {
  yandexMusic,
  spotify,
  youtubeMusic,
  vkMusic,
  localStorage,
}
