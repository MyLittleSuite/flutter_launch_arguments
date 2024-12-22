import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/services/arguments_service.dart',
  kotlinOut:
      'android/src/main/kotlin/com/mylittlesuite/flutter_launch_arguments/services/ArgumentsService.kt',
  kotlinOptions: KotlinOptions(
    package: 'com.mylittlesuite.flutter_launch_arguments.services',
  ),
  swiftOut: 'ios/Classes/Services/ArgumentsService.swift',
  dartPackageName: 'flutter_launch_arguments',
))
@HostApi()
abstract class ArgumentsService {
  String? getString(String key);
  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
}
