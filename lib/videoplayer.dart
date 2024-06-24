import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:tamashaaa/screens/home/controllers/flick_custom_controls.dart';
import 'package:tamashaaa/utils/colors.dart';
import 'package:tamashaaa/utils/mock_data.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        mockData['items'][0]['trailer_url'],
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
        backgroundColor: Color(kbgcolor),
        title: const Center(
          child: Text(
            "Tamasha",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: ListView(
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
        ],
      ),
    );
  }
}
