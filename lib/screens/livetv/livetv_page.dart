import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:tamashaaa/screens/home/controllers/flick_custom_controls.dart';
// import 'package:tamashaaa/screens/home/multi_manager/flick_multi_manager.dart';
// import 'package:tamashaaa/utils/mock_data.dart';
import 'package:video_player/video_player.dart';

class LivetvPage extends StatefulWidget {
  const LivetvPage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LivetvPage> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://d3f7s46yjfj8ik.cloudfront.net/out/v1/a6a7f29e556c494f82d84a46645da60e/index.m3u8?uuid=FFFFFFFF-278b-480a-4e23-13d3bf2dad7f '),
    );
  }

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
      body: AspectRatio(
        aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            closedCaptionTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            // iconThemeData: IconThemeData(color: Colors.black, ze: 12),
            // controls: FlickPortraitControls(),
            controls: FlickCustomControls(flickManager: flickManager),
          ),
          preferredDeviceOrientationFullscreen: const [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ],
        ),
      ),
    );
  }
}
