/*
 * Copyright (c) 2024 MyLittleSuite
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

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
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('flutter_launch_arguments example app'),
          ),
          body: ListView(
            children: [
              FutureBuilder<String?>(
                future: _flutterLaunchArgumentsPlugin.getString('foo'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('foo'),
                ),
              ),
              FutureBuilder<bool?>(
                future: _flutterLaunchArgumentsPlugin.getBool('isFooEnabled'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('isFooEnabled'),
                ),
              ),
              FutureBuilder<double?>(
                future: _flutterLaunchArgumentsPlugin.getDouble('fooValue'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('fooValue'),
                ),
              ),
              FutureBuilder<int?>(
                future: _flutterLaunchArgumentsPlugin.getInt('fooInt'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('fooInt'),
                ),
              ),
              FutureBuilder<String?>(
                future: _flutterLaunchArgumentsPlugin.getString('fooAbsent'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('absent String'),
                ),
              ),
              FutureBuilder<bool?>(
                future: _flutterLaunchArgumentsPlugin.getBool('fooAbsent'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('absent Bool'),
                ),
              ),
              FutureBuilder<double?>(
                future: _flutterLaunchArgumentsPlugin.getDouble('fooAbsent'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('absent Double'),
                ),
              ),
              FutureBuilder<int?>(
                future: _flutterLaunchArgumentsPlugin.getInt('fooAbsent'),
                builder: (context, snapshot) => ListTile(
                  title: Text('${snapshot.data}'),
                  subtitle: const Text('absent Int'),
                ),
              ),
            ],
          ),
        ),
      );
}
