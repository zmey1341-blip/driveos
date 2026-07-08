# DriveOS - Advanced In-Car Infotainment System

## Overview

DriveOS is a comprehensive Flutter-based infotainment system designed for automotive applications. It integrates multiple modules for navigation, music, vehicle diagnostics, dash cam recording, and much more.

## Architecture

The application follows a clean, modular architecture:

```
lib/
├── core/                    # Core functionality (logging, storage, DI)
├── config/                  # App configuration and initialization
├── modules/                 # Feature modules
│   ├── varvara/            # Voice assistant
│   ├── navigation/         # Navigation system
│   ├── music/              # Music player
│   ├── vehicle/            # Vehicle management
│   ├── obd/                # OBD diagnostics
│   ├── dashcam/            # Dash camera
│   ├── connectivity/       # Network management
│   ├── storage/            # Storage management
│   ├── security/           # Authentication & security
│   └── notifications/      # Notification system
├── screens/                # Main application screens
└── main.dart              # Application entry point
```

## Modules

### Varvara (Voice Assistant)
- Natural language voice commands
- Speech recognition and synthesis
- Context-aware responses

### Navigation
- Multi-provider support (Google Maps, Yandex Navigator, 2GIS, Organic Maps)
- Route planning and optimization
- Offline map support

### Music
- Multiple music service providers
- Playback control and favorites
- Voice integration

### Vehicle
- Multiple vehicle profiles
- Service history tracking
- Mileage management

### OBD
- OBD-II diagnostics
- Error code reading and clearing
- Real-time parameter monitoring

### DashCam
- Continuous video recording
- Event detection
- Parked mode monitoring

### Connectivity
- Internet, GPS, Bluetooth management
- WiFi and GSM monitoring
- Offline mode support

### Storage
- Internal and external storage management
- Cache handling
- Automatic cleanup

### Security
- Biometric authentication
- Data encryption
- Secure storage

### Notifications
- Local and push notifications
- Scheduling and categories

## Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Android SDK or Xcode (for iOS)

### Installation

1. Clone the repository
```bash
git clone https://github.com/zmey1341-blip/driveos.git
```

2. Navigate to project directory
```bash
cd driveos
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## Dependencies

- **flutter_riverpod**: State management
- **shared_preferences**: Local storage
- **hive**: Local database
- **dio**: HTTP client
- **geolocator**: GPS services
- **just_audio**: Audio playback
- **usb_serial**: OBD communication
- **get_it**: Dependency injection

## Project Structure

Each module follows this structure:
```
module_name/
├── models/          # Data models
├── services/        # Business logic
├── providers/       # Riverpod providers
├── widgets/         # UI components
├── screens/         # Feature screens
└── README.md        # Module documentation
```

## State Management

The app uses **Riverpod** for state management with:
- `StateProvider` for simple state
- `FutureProvider` for async operations
- `Provider` for read-only values

## Logging

Centralized logging through `LoggerService` with levels:
- Verbose
- Debug
- Info
- Warning
- Error
- Fatal

## Testing

```bash
flutter test
```

## Contributing

1. Create a feature branch
2. Commit your changes
3. Push to the branch
4. Create a Pull Request

## License

MIT License - see LICENSE file for details

## Author

zmey1341-blip

## Support

For support, email zmey1341@gmail.com or create an issue in the repository.
