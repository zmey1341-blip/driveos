import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../models/varvara_personality.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class VarvaraService {
  final LoggerService _logger = getIt<LoggerService>();
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _tts = FlutterTts();
  
  VarvaraPersonality _currentPersonality = VarvaraPersonality.defaultPersonalities[0];
  bool _isListening = false;
  String _lastHeardText = '';

  Future<void> init() async {
    try {
      await _speechToText.initialize(
        onError: (error) => _logger.error('Speech error: $error'),
        onStatus: (status) => _logger.debug('Speech status: $status'),
      );
      
      await _tts.setLanguage('ru-RU');
      await _tts.setSpeechRate(0.5);
      
      _logger.info('Varvara initialized successfully');
    } catch (e) {
      _logger.error('Failed to initialize Varvara', e);
    }
  }

  Future<void> startListening() async {
    if (_isListening) return;
    
    try {
      _isListening = true;
      await _speechToText.listen(
        onResult: (result) {
          _lastHeardText = result.recognizedWords;
          _logger.debug('Heard: $_lastHeardText');
        },
        localeId: 'ru_RU',
      );
    } catch (e) {
      _logger.error('Failed to start listening', e);
      _isListening = false;
    }
  }

  Future<void> stopListening() async {
    if (!_isListening) return;
    
    try {
      await _speechToText.stop();
      _isListening = false;
    } catch (e) {
      _logger.error('Failed to stop listening', e);
    }
  }

  Future<void> speak(String text) async {
    try {
      await _tts.speak(text);
    } catch (e) {
      _logger.error('Failed to speak', e);
    }
  }

  void setPersonality(VarvaraPersonality personality) {
    _currentPersonality = personality;
    _logger.info('Personality changed to: ${personality.name}');
  }

  VarvaraPersonality get currentPersonality => _currentPersonality;
  bool get isListening => _isListening;
  String get lastHeardText => _lastHeardText;
}

final varvaraServiceProvider = Provider((ref) => VarvaraService());
