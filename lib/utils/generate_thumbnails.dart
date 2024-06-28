// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

// class GenerateThumbnail {
//   static Future<List<File>> getThumbnails(String videoUrl,
//       {int intervalSeconds = 1, int count = 4}) async {
//     List<File> files = [];
//     final String tempDir = (await getTemporaryDirectory()).path;

//     for (int i = 0; i < count; i++) {
//       try {
//         final int timeMs = i * intervalSeconds * 1000;
//         final String? filename = await VideoThumbnail.thumbnailFile(
//           video: videoUrl,
//           thumbnailPath: tempDir,
//           imageFormat: ImageFormat.WEBP,
//           quality: 100,
//           timeMs: timeMs,
//         );

//         if (filename != null) {
//           files.add(File(filename));
//           print("Generated thumbnail at $timeMs ms: $filename");
//         } else {
//           print("Failed to generate thumbnail at $timeMs ms");
//         }
//       } catch (e) {
//         print(
//             "Error generating thumbnail at ${i * intervalSeconds} seconds: $e");
//       }
//     }
//     print("HERE IS THE FILE CONTENT" + "$files");
//     return files;
//   }
// }
