import 'package:flutter/services.dart';

Future<List<Map<String, String>>> fetchResolutionsFromAssets(
    String assetPath) async {
  final data = await rootBundle.loadString("assets/videos/graphics.m3u8");
  List<Map<String, String>> resolutions = [];
  final lines = data.split('\n');

  for (int i = 0; i < lines.length; i++) {
    if (lines[i].contains('EXTINF')) {
      final duration = lines[i].split(':')[1].split(',')[0];
      final url = lines[i + 1];
      resolutions.add({'duration': duration, 'url': url});
    }
  }
  return resolutions;
}
