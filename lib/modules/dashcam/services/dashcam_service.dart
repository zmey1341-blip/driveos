import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashcam_models.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class DashCamService {
  final LoggerService _logger = getIt<LoggerService>();
  
  bool _isRecording = false;
  bool _isParked = false;
  List<DashCamEvent> _events = [];
  List<DashCamRecording> _recordings = [];
  int _storageUsage = 0; // in MB

  Future<void> init() async {
    try {
      _logger.info('DashCam service initialized');
    } catch (e) {
      _logger.error('Failed to initialize DashCam service', e);
    }
  }

  Future<void> startRecording() async {
    try {
      _isRecording = true;
      _logger.info('DashCam recording started');
    } catch (e) {
      _logger.error('Failed to start recording', e);
      _isRecording = false;
    }
  }

  Future<void> stopRecording() async {
    try {
      _isRecording = false;
      _logger.info('DashCam recording stopped');
    } catch (e) {
      _logger.error('Failed to stop recording', e);
    }
  }

  Future<void> startParkedMode() async {
    try {
      _isParked = true;
      _logger.info('DashCam parked mode activated');
    } catch (e) {
      _logger.error('Failed to activate parked mode', e);
    }
  }

  void recordEvent(DashCamEvent event) {
    try {
      _events.add(event);
      _logger.info('DashCam event recorded: ${event.type}');
    } catch (e) {
      _logger.error('Failed to record event', e);
    }
  }

  Future<void> deleteRecording(String recordingId) async {
    try {
      _recordings.removeWhere((r) => r.id == recordingId);
      _logger.info('Recording deleted: $recordingId');
    } catch (e) {
      _logger.error('Failed to delete recording', e);
    }
  }

  bool get isRecording => _isRecording;
  bool get isParked => _isParked;
  List<DashCamEvent> get events => _events;
  List<DashCamRecording> get recordings => _recordings;
  int get storageUsage => _storageUsage;
}

final dashCamServiceProvider = Provider((ref) => DashCamService());
