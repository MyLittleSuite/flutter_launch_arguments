# flutter_launch_arguments

A flutter plugin to retrieve Android and iOS launch arguments

[![Pub](https://img.shields.io/pub/v/flutter_launch_arguments.svg)](https://pub.dev/packages/flutter_launch_arguments)
![Dart CI](https://github.com/MyLittleSuite/flutter_launch_arguments/workflows/Dart%20CI/badge.svg)
[![Star on GitHub](https://img.shields.io/github/stars/MyLittleSuite/flutter_launch_arguments.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/MyLittleSuite/flutter_launch_arguments)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

## Motivation

There are some cases where you need to pass arguments to your app when launching it. Typically, in
Flutter you can use --dart-define or --dart-define-from-file to pass arguments to your app. However,
these arguments are only available at runtime and not when the app is already installed. This plugin
allows you to retrieve the launch arguments on both Android and iOS.

This plugin comes in handy when you need to pass arguments to your app when launching
instrumentation
tests. For example, you might need to set up a test environment or configure your app in a specific
way when running tests. This plugin allows you to pass arguments to your app when launching the
tests
and retrieve them in your app.

## Getting Started

Add the following dependencies to your pubspec.yaml:

```yaml
dependencies:
  flutter_launch_arguments: latest
```

## Usage

flutter_launch_arguments provides a simple API to retrieve launch arguments from the platform.
To get a launch argument, you can use the following methods:

- `getString(String key)`: retrieves a string argument from the launch arguments
- `getBool(String key)`: retrieves a boolean argument from the launch arguments
- `getDouble(String key)`: retrieves a double argument from the launch arguments
- `getInt(String key)`: retrieves an integer argument from the launch arguments

These methods return a `Future` with the type of the argument you are trying to retrieve.
If the argument is not found, the future will return `null` except for `getBool`, `getInt` and
`getDouble` which will return `false`, `0` and `0.0` respectively on iOS.

Before using these methods, you need to initialize the plugin by calling `FlutterLaunchArguments()`
which is a singleton.

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_launch_arguments/flutter_launch_arguments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FlutterLaunchArguments _flutterLaunchArgumentsPlugin;

  @override
  void initState() {
    super.initState();

    _flutterLaunchArgumentsPlugin = FlutterLaunchArguments();
  }

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('flutter_launch_arguments example app'),
          ),
          body: ListView(
            children: [
              FutureBuilder<String?>(
                future: _flutterLaunchArgumentsPlugin.getString('foo'),
                builder: (context, snapshot) =>
                    ListTile(
                      title: Text('${snapshot.data}'),
                      subtitle: const Text('foo'),
                    ),
              ),
              FutureBuilder<bool?>(
                future: _flutterLaunchArgumentsPlugin.getBool('isFooEnabled'),
                builder: (context, snapshot) =>
                    ListTile(
                      title: Text('${snapshot.data}'),
                      subtitle: const Text('isFooEnabled'),
                    ),
              ),
              FutureBuilder<double?>(
                future: _flutterLaunchArgumentsPlugin.getDouble('fooValue'),
                builder: (context, snapshot) =>
                    ListTile(
                      title: Text('${snapshot.data}'),
                      subtitle: const Text('fooValue'),
                    ),
              ),
              FutureBuilder<int?>(
                future: _flutterLaunchArgumentsPlugin.getInt('fooInt'),
                builder: (context, snapshot) =>
                    ListTile(
                      title: Text('${snapshot.data}'),
                      subtitle: const Text('fooInt'),
                    ),
              ),
            ],
          ),
        ),
      );
}
```

## Passing arguments to the app

### Android

To pass arguments to your app on Android, you can use the `adb shell am start` command. For example:

```shell
adb shell am start -n com.example.myapp/com.example.myapp.MainActivity --es foo bar --ez isFooEnabled true --ed fooValue 3.14 --ei fooInt 42
```

### iOS

To pass arguments to your app on iOS, you can use the `xcrun simctl` command. For example:

```shell
xcrun simctl launch booted com.example.myapp -foo bar -isFooEnabled "true" -fooValue 3.14 -fooInt 42
```

## Questions and bugs

Please feel free to submit new issues if you encounter problems while using this library.

If you need help with the use of the library or you just want to request new features, please use
the [Discussions](https://github.com/MyLittleSuite/flutter_launch_arguments/discussions) section of
the
repository. Issues opened as questions will be automatically closed.

## License

flutter_launch_arguments is available under the MIT license. See the LICENSE
file for more info.
