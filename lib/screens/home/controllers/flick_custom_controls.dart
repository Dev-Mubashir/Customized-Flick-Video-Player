import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:tamashaaa/screens/home/controllers/fetch_video_resolution.dart';
import 'package:tamashaaa/screens/home/controllers/speed_menu.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class FlickCustomControls extends StatelessWidget {
  FlickCustomControls(
      {super.key,
      this.iconSize = 20,
      this.fontSize = 12,
      this.progressBarSettings,
      required this.flickManager});
  FlickManager flickManager;

  final double iconSize;
  final double fontSize;
  final FlickProgressBarSettings? progressBarSettings;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: FlickAutoHideChild(
                child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(39, 0, 0, 0),
          ),
        ))),
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    showIfVideoNotInitialized: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                              icon: const Icon(
                                Icons.skip_previous,
                                color: Colors.black,
                                size: 25,
                              ),
                              onPressed: () {}),
                        ),
                        FlickPlayToggle(
                          size: 30,
                          color: Colors.black,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.black,
                                size: 25,
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            children: [
              Icon(
                Icons.closed_caption,
                size: iconSize,
              ),
              IconButton(
                icon: Icon(Icons.more_vert, size: iconSize),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.high_quality),
                              title: const Text('Video Resolution'),
                              onTap: () async {
                                final resolutions =
                                    await fetchVideoResolutions();
                                Navigator.pop(context); // Close the first modal
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: resolutions
                                            .map((res) => ListTile(
                                                  title:
                                                      Text(res['resolution']!),
                                                  onTap: () {
                                                    flickManager
                                                        .flickControlManager
                                                        ?.pause();
                                                    flickManager = FlickManager(
                                                      videoPlayerController:
                                                          VideoPlayerController
                                                              .network(
                                                                  res['url']!),
                                                    );
                                                    flickManager
                                                        .flickControlManager
                                                        ?.play();
                                                    Navigator.pop(
                                                        context); // Close the resolution modal
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.speed),
                              title: const Text('Speed'),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: SpeedMenu(
                                        flickManager: flickManager,
                                        iconSize: iconSize,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlickVideoProgressBar(
                    flickProgressBarSettings: progressBarSettings,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlickPlayToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      FlickSoundToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      Row(
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: fontSize,
                          ),
                          FlickAutoHideChild(
                            child: Text(
                              ' / ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: fontSize),
                            ),
                          ),
                          FlickTotalDuration(
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlickSubtitleToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      FlickFullScreenToggle(
                        size: iconSize,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onLongPressStart: (_) async {
                flickManager.flickControlManager?.setPlaybackSpeed(2.0);
                await Vibration.vibrate(duration: 50);
              },
              onLongPressEnd: (_) {
                flickManager.flickControlManager?.setPlaybackSpeed(1.0);
              },
            ),
          ),
        ),
      ],
    );
  }
}
