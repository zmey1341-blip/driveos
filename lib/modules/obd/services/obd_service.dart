import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usb_serial/usb_serial.dart';
import '../models/obd_models.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class OBDService {
  final LoggerService _logger = getIt<LoggerService>();
  
  bool _isConnected = false;
  List<OBDError> _errors = [];
  List<OBDParameter> _parameters = [];
  UsbPort? _port;

  Future<void> init() async {
    try {
      final ports = await UsbSerial.listPorts();
      _logger.info('OBD ports available: ${ports.length}');
    } catch (e) {
      _logger.error('Failed to initialize OBD service', e);
    }
  }

  Future<bool> connect() async {
    try {
      final ports = await UsbSerial.listPorts();
      if (ports.isEmpty) {
        _logger.warning('No OBD devices found');
        return false;
      }
      
      _port = ports.first;
      _isConnected = true;
      _logger.info('OBD connected successfully');
      return true;
    } catch (e) {
      _logger.error('Failed to connect to OBD', e);
      return false;
    }
  }

  Future<void> disconnect() async {
    try {
      if (_port != null) {
        await _port?.close();
        _isConnected = false;
        _logger.info('OBD disconnected');
      }
    } catch (e) {
      _logger.error('Failed to disconnect OBD', e);
    }
  }

  Future<List<OBDError>> readErrors() async {
    try {
      if (!_isConnected) {
        _logger.warning('OBD not connected');
        return [];
      }
      
      // Simulated error reading
      _logger.info('Reading errors from OBD');
      return _errors;
    } catch (e) {
      _logger.error('Failed to read errors', e);
      return [];
    }
  }

  Future<List<OBDParameter>> readParameters() async {
    try {
      if (!_isConnected) {
        _logger.warning('OBD not connected');
        return [];
      }
      
      // Simulated parameter reading
      _logger.info('Reading parameters from OBD');
      return _parameters;
    } catch (e) {
      _logger.error('Failed to read parameters', e);
      return [];
    }
  }

  Future<void> clearErrors() async {
    try {
      if (!_isConnected) {
        _logger.warning('OBD not connected');
        return;
      }
      
      _errors.clear();
      _logger.info('Errors cleared');
    } catch (e) {
      _logger.error('Failed to clear errors', e);
    }
  }

  bool get isConnected => _isConnected;
  List<OBDError> get errors => _errors;
  List<OBDParameter> get parameters => _parameters;
}

final obdServiceProvider = Provider((ref) => OBDService());
