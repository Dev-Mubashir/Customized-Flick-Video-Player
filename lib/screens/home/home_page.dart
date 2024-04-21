import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:tamashaaa/screens/home/controllers/customprogressbar.dart';
import 'package:tamashaaa/screens/home/multi_manager/flick_multi_manager.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset(
        'assets/videos/graphics.mp4',
      ),
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
            "Tamashaaa",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: const FlickVideoWithControls(
            iconThemeData: IconThemeData(color: Colors.black),
            controls: FlickPortraitControls(),
          ),
          preferredDeviceOrientationFullscreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ],
        ),
      ),
    );
  }
}
