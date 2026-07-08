import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '../models/music_models.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class MusicService {
  final LoggerService _logger = getIt<LoggerService>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  MusicProvider _selectedProvider = MusicProvider.yandexMusic;
  MusicTrack? _currentTrack;
  List<MusicTrack> _currentPlaylist = [];
  bool _isPlaying = false;

  Future<void> init() async {
    try {
      _audioPlayer.playerStateStream.listen((state) {
        _isPlaying = state.playing;
      });
      _logger.info('Music service initialized');
    } catch (e) {
      _logger.error('Failed to initialize music service', e);
    }
  }

  Future<void> playTrack(MusicTrack track) async {
    try {
      _currentTrack = track;
      _isPlaying = true;
      _logger.info('Now playing: ${track.title} by ${track.artist}');
    } catch (e) {
      _logger.error('Failed to play track', e);
    }
  }

  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
      _isPlaying = false;
    } catch (e) {
      _logger.error('Failed to pause', e);
    }
  }

  Future<void> resume() async {
    try {
      await _audioPlayer.play();
      _isPlaying = true;
    } catch (e) {
      _logger.error('Failed to resume', e);
    }
  }

  Future<void> next() async {
    try {
      final currentIndex = _currentPlaylist.indexOf(_currentTrack!);
      if (currentIndex < _currentPlaylist.length - 1) {
        await playTrack(_currentPlaylist[currentIndex + 1]);
      }
    } catch (e) {
      _logger.error('Failed to skip to next track', e);
    }
  }

  Future<void> previous() async {
    try {
      final currentIndex = _currentPlaylist.indexOf(_currentTrack!);
      if (currentIndex > 0) {
        await playTrack(_currentPlaylist[currentIndex - 1]);
      }
    } catch (e) {
      _logger.error('Failed to skip to previous track', e);
    }
  }

  Future<void> toggleFavorite(MusicTrack track) async {
    try {
      _logger.info('Toggled favorite for: ${track.title}');
    } catch (e) {
      _logger.error('Failed to toggle favorite', e);
    }
  }

  void setProvider(MusicProvider provider) {
    _selectedProvider = provider;
    _logger.info('Music provider changed to: ${provider.toString()}');
  }

  MusicProvider get selectedProvider => _selectedProvider;
  MusicTrack? get currentTrack => _currentTrack;
  bool get isPlaying => _isPlaying;
  List<MusicTrack> get currentPlaylist => _currentPlaylist;

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}

final musicServiceProvider = Provider((ref) => MusicService());
