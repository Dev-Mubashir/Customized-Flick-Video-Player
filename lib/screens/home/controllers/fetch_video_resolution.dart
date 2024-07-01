import 'package:http/http.dart' as http;

Future<List<Map<String, String>>> fetchVideoResolutions() async {
  final response = await http.get(Uri.parse(
      'https://cdn02khi.tamashaweb.com:8087/jazzauth/ARYdigital-abr/playlist.m3u8'));

  if (response.statusCode == 200) {
    final lines = response.body.split('\n');
    List<Map<String, String>> resolutions = [];
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('#EXT-X-STREAM-INF')) {
        final resolution = lines[i]
            .split(',')
            .firstWhere((element) => element.startsWith('RESOLUTION'))
            .split('=')[1];

        final url = lines[i + 1];
        resolutions.add({'resolution': resolution, 'url': url});
      }
    }
    return resolutions;
  } else {
    throw Exception('Failed to load video resolutions');
  }
}
