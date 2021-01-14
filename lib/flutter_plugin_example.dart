
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginExample {
  static const MethodChannel _channel = const MethodChannel('flutter_plugin_example');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<List<int>> call([int number = 0]) async {
    if (number < 0) {
      return [0, 0];
    } else {
      final Iterable<int> result = await _channel.invokeMethod(
        'call',
        <String, dynamic>{
          'number': number,
        },
      );
      return result.toList();
    }
  }
}
