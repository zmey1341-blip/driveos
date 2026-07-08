class Vehicle {
  final String id;
  final String make;
  final String model;
  final String generation;
  final int year;
  final String engine;
  final String transmission;
  final String drive;
  final String? vin;
  final int mileage;
  final String color;
  final String? vehicleName;
  final String? ownerName;
  final Map<String, dynamic> specifications;
  final DateTime createdAt;

  Vehicle({
    required this.id,
    required this.make,
    required this.model,
    required this.generation,
    required this.year,
    required this.engine,
    required this.transmission,
    required this.drive,
    this.vin,
    required this.mileage,
    required this.color,
    this.vehicleName,
    this.ownerName,
    required this.specifications,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'make': make,
    'model': model,
    'generation': generation,
    'year': year,
    'engine': engine,
    'transmission': transmission,
    'drive': drive,
    'vin': vin,
    'mileage': mileage,
    'color': color,
    'vehicleName': vehicleName,
    'ownerName': ownerName,
    'specifications': specifications,
    'createdAt': createdAt.toIso8601String(),
  };

  factory Vehicle.fromMap(Map<String, dynamic> map) => Vehicle(
    id: map['id'],
    make: map['make'],
    model: map['model'],
    generation: map['generation'],
    year: map['year'],
    engine: map['engine'],
    transmission: map['transmission'],
    drive: map['drive'],
    vin: map['vin'],
    mileage: map['mileage'],
    color: map['color'],
    vehicleName: map['vehicleName'],
    ownerName: map['ownerName'],
    specifications: map['specifications'] ?? {},
    createdAt: DateTime.parse(map['createdAt']),
  );
}

class VehicleServiceRecord {
  final String id;
  final String vehicleId;
  final String serviceType;
  final DateTime date;
  final int mileage;
  final String? description;
  final double? cost;
  final String? provider;
  final List<String>? partsCodes;

  VehicleServiceRecord({
    required this.id,
    required this.vehicleId,
    required this.serviceType,
    required this.date,
    required this.mileage,
    this.description,
    this.cost,
    this.provider,
    this.partsCodes,
  });
}
