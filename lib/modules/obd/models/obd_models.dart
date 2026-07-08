class OBDError {
  final String code;
  final String title;
  final String description;
  final String? solution;
  final List<String>? possibleCauses;
  final bool canContinueDriving;
  final String severity; // info, warning, critical

  OBDError({
    required this.code,
    required this.title,
    required this.description,
    this.solution,
    this.possibleCauses,
    required this.canContinueDriving,
    required this.severity,
  });
}

class OBDParameter {
  final String name;
  final String unit;
  final double value;
  final double? minValue;
  final double? maxValue;
  final bool isNormal;

  OBDParameter({
    required this.name,
    required this.unit,
    required this.value,
    this.minValue,
    this.maxValue,
    required this.isNormal,
  });
}
