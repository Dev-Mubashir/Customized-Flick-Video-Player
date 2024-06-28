// import 'package:http/http.dart' as http;

// Future<List<Map<String, String>>> fetchVideoResolutions() async {
//   final response = await http.get(Uri.parse(
//       'https://cdn05isb.tamashaweb.com:8087/hls-reels/reels/a35b3eb8-924b-4441-8304-a0f1b1747dca/smil:mpfour.smil/playlist.m3u8?wmsAuthSign=c2VydmVyX3RpbWU9Ni8yNy8yMDI0IDk6NDc6MzEgQU0maGFzaF92YWx1ZT1lQWovaEpSdTFqVFJkdHhFUDUxY25BPT0mdmFsaWRtaW51dGVzPTE='));

//   if (response.statusCode == 200) {
//     final lines = response.body.split('\n');
//     List<Map<String, String>> resolutions = [];
//     for (int i = 0; i < lines.length; i++) {
//       if (lines[i].startsWith('#EXT-X-STREAM-INF')) {
//         final resolution = lines[i]
//             .split(',')
//             .firstWhere((element) => element.startsWith('RESOLUTION'))
//             .split('=')[1];
//         final url = lines[i + 1];
//         resolutions.add({'resolution': resolution, 'url': url});
//         print('Resolution: $resolution, URL: $url');
//       }
//     }
//     return resolutions;
//   } else {
//     throw Exception('Failed to load video resolutions');
//   }
// }
