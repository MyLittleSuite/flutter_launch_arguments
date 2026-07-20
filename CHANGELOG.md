## Unreleased

## 1.1.0

* Added Swift Package Manager support for iOS (CocoaPods still supported)
* Fixed `getBool`, `getInt` and `getDouble` returning default values instead of `null` when a launch argument was stored as a `String` (e.g. via `adb shell am start --es` or Maestro's `launchApp arguments:`) on both Android and iOS

## 1.0.1

* Enforced nullability for missing parameters

## 1.0.0

* First release
