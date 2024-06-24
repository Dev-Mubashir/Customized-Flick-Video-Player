import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:tamashaaa/screens/home/controllers/speed_menu.dart';
import 'package:vibration/vibration.dart';

/// Default portrait controls.
class FlickCustomControls extends StatelessWidget {
  const FlickCustomControls(
      {super.key,
      this.iconSize = 20,
      this.fontSize = 12,
      this.progressBarSettings,
      required this.flickManager});
  final FlickManager flickManager;

  /// Icon size.
  ///
  /// This size is used for all the player icons.
  final double iconSize;

  /// Font size.
  ///
  /// This size is used for all the text.
  final double fontSize;

  /// [FlickProgressBarSettings] settings.
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
        //This row at the top provide the funcionality of speedcontrol and captions
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
                              onTap: () {
                                // Handle option 1 tap
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
                            // Add more options here
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
                // Set speed to 2.0x
                flickManager.flickControlManager?.setPlaybackSpeed(2.0);
                // Perform vibration
                await Vibration.vibrate(duration: 50); // Short vibration
              },
              onLongPressEnd: (_) {
                // Reset speed to 1.0x
                flickManager.flickControlManager?.setPlaybackSpeed(1.0);
              },
            ),
          ),
        ),
      ],
    );
  }
}
