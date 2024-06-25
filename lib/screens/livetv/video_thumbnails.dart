import 'dart:typed_data';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailGenerator {
  final String videoPath;

  ThumbnailGenerator({required this.videoPath});

  Future<List<Uint8List?>> generateThumbnails({int count = 10}) async {
    List<Uint8List?> thumbnails = [];
    final int interval = 1000; // Time interval in milliseconds

    print("Starting thumbnail generation for $videoPath");

    for (int i = 0; i < count; i++) {
      try {
        final thumbnail = await VideoThumbnail.thumbnailData(
          video: videoPath,
          imageFormat: ImageFormat.JPEG,
          quality: 50,
          timeMs: i * interval,
        );
        print("Generated thumbnail for interval $i: ${thumbnail != null}");
        thumbnails.add(thumbnail);
      } catch (e) {
        print("Error generating thumbnail for interval $i: $e");
      }
    }

    return thumbnails;
  }
}
