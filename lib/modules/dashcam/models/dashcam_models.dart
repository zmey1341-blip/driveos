class DashCamEvent {
  final String id;
  final String type; // collision, harsh_braking, sharp_turn, etc
  final DateTime timestamp;
  final String videoPath;
  final double? speed;
  final double? gForce;
  final String? location;
  final Map<String, dynamic> metadata;

  DashCamEvent({
    required this.id,
    required this.type,
    required this.timestamp,
    required this.videoPath,
    this.speed,
    this.gForce,
    this.location,
    required this.metadata,
  });
}

class DashCamRecording {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final String filePath;
  final int duration;
  final double fileSize;
  final bool isPinned;
  final bool isBackup;

  DashCamRecording({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.filePath,
    required this.duration,
    required this.fileSize,
    required this.isPinned,
    required this.isBackup,
  });
}
