import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:tamashaaa/screens/home/controllers/fetch_resolution_asset.dart';
import 'package:tamashaaa/screens/home/controllers/flick_custom_controls.dart';
import 'package:video_player/video_player.dart';
// import 'thumbnail_generator.dart'; // Import the GenerateThumbnail class

class LivetvPage extends StatefulWidget {
  const LivetvPage({super.key});

  @override
  _LivetvPageState createState() => _LivetvPageState();
}

class _LivetvPageState extends State<LivetvPage> {
  late FlickManager flickManager;
  List<Uint8List?> _thumbnails = [];

  List<Map<String, String>> resolutions = [];
  // final String assetPath = 'assets/videos/graphics.m3u8';

  @override
  void initState() {
    super.initState();
    print("Initializing LivetvPage");
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            "https://d3f7s46yjfj8ik.cloudfront.net/out/v1/a6a7f29e556c494f82d84a46645da60e/index.m3u8?uuid=FFFFFFFF-278b-480a-4e23-13d3bf2dad7f"));

    // fetchResolutionsFromAssets(assetPath).then((res) {
    //   setState(() {
    //     resolutions = res;
    //   });
    // });
    // _generateThumbnails();
  }

  // Future<void> _generateThumbnails() async {
  //   print("Starting thumbnail generation");
  //   try {
  //     List<Uint8List?> thumbnails = [];
  //     List<File> thumbnailFiles = await GenerateThumbnail.getThumbnails(
  //       "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //       intervalSeconds: 1,
  //       count: 4,
  //     );

  //     for (File file in thumbnailFiles) {
  //       Uint8List thumbnailBytes = await file.readAsBytes();
  //       thumbnails.add(thumbnailBytes);
  //     }

  //     setState(() {
  //       _thumbnails = thumbnails;
  //       print("Thumbnails generated: ${_thumbnails.length}");
  //     });
  //   } catch (e) {
  //     print("Error generating thumbnails: $e");
  //   }
  // }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Tamasha",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
            child: FlickVideoPlayer(
              flickManager: flickManager,
              flickVideoWithControls: FlickVideoWithControls(
                closedCaptionTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                controls: FlickCustomControls(flickManager: flickManager),
              ),
              preferredDeviceOrientationFullscreen: const [
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ],
            ),
          ),
          if (_thumbnails.isNotEmpty)
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _thumbnails.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: 60,
                    child: _thumbnails[index] != null
                        ? Image.memory(_thumbnails[index]!)
                        : Container(
                            color: Colors.grey,
                          ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
