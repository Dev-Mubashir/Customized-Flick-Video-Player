import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:tamashaaa/screens/home/controllers/flick_custom_controls.dart';
import 'package:tamashaaa/screens/home/view/thumbnails.dart';
// import 'package:tamashaaa/screens/home/multi_manager/flick_multi_manager.dart';
import 'package:tamashaaa/utils/mock_data.dart';
import 'package:video_player/video_player.dart';
import 'package:tamashaaa/screens/home/view/jsonconversion.dart';

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
                closedCaptionTextStyle: TextStyle(
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
          FutureBuilder<List<dynamic>>(
            future: loadmovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieList(movies: snapshot.data!);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error loading movies');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
