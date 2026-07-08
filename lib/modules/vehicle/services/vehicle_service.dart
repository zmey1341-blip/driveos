import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/vehicle_models.dart';
import '../../../core/storage/storage_service.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class VehicleService {
  final LoggerService _logger = getIt<LoggerService>();
  final StorageService _storage = getIt<StorageService>();
  
  Vehicle? _currentVehicle;
  List<Vehicle> _vehicles = [];
  List<VehicleServiceRecord> _serviceRecords = [];

  Future<void> init() async {
    try {
      _vehicles = _storage.getAllVehicles().cast<Vehicle>();
      _logger.info('Vehicle service initialized with ${_vehicles.length} vehicles');
    } catch (e) {
      _logger.error('Failed to initialize vehicle service', e);
    }
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      _vehicles.add(vehicle);
      await _storage.saveVehicle(vehicle.id, vehicle.toMap());
      _logger.info('Vehicle added: ${vehicle.make} ${vehicle.model}');
    } catch (e) {
      _logger.error('Failed to add vehicle', e);
    }
  }

  Future<void> selectVehicle(String vehicleId) async {
    try {
      _currentVehicle = _vehicles.firstWhere((v) => v.id == vehicleId);
      await _storage.saveGeneral('currentVehicleId', vehicleId);
      _logger.info('Vehicle selected: ${_currentVehicle!.make} ${_currentVehicle!.model}');
    } catch (e) {
      _logger.error('Failed to select vehicle', e);
    }
  }

  Future<void> updateMileage(int newMileage) async {
    try {
      if (_currentVehicle != null) {
        final updated = Vehicle(
          id: _currentVehicle!.id,
          make: _currentVehicle!.make,
          model: _currentVehicle!.model,
          generation: _currentVehicle!.generation,
          year: _currentVehicle!.year,
          engine: _currentVehicle!.engine,
          transmission: _currentVehicle!.transmission,
          drive: _currentVehicle!.drive,
          vin: _currentVehicle!.vin,
          mileage: newMileage,
          color: _currentVehicle!.color,
          vehicleName: _currentVehicle!.vehicleName,
          ownerName: _currentVehicle!.ownerName,
          specifications: _currentVehicle!.specifications,
          createdAt: _currentVehicle!.createdAt,
        );
        _currentVehicle = updated;
        await _storage.saveVehicle(updated.id, updated.toMap());
        _logger.info('Mileage updated to $newMileage');
      }
    } catch (e) {
      _logger.error('Failed to update mileage', e);
    }
  }

  Future<void> addServiceRecord(VehicleServiceRecord record) async {
    try {
      _serviceRecords.add(record);
      _logger.info('Service record added: ${record.serviceType}');
    } catch (e) {
      _logger.error('Failed to add service record', e);
    }
  }

  Vehicle? get currentVehicle => _currentVehicle;
  List<Vehicle> get vehicles => _vehicles;
  List<VehicleServiceRecord> get serviceRecords => _serviceRecords;
}

final vehicleServiceProvider = Provider((ref) => VehicleService());
