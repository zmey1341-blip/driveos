class NavigationRoute {
  final String id;
  final String name;
  final double distance;
  final Duration estimatedTime;
  final List<NavigationWaypoint> waypoints;
  final bool isFavorite;
  final DateTime createdAt;

  NavigationRoute({
    required this.id,
    required this.name,
    required this.distance,
    required this.estimatedTime,
    required this.waypoints,
    required this.isFavorite,
    required this.createdAt,
  });
}

class NavigationWaypoint {
  final double latitude;
  final double longitude;
  final String? name;
  final String? address;

  NavigationWaypoint({
    required this.latitude,
    required this.longitude,
    this.name,
    this.address,
  });
}

enum NavigationProvider {
  googleMaps,
  yandexNavigator,
  twoGis,
  organicMaps,
}
