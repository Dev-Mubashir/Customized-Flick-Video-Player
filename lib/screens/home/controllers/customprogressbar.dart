import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  // final FlickVideoProgressBar flickProgressBar;

  // const CustomProgressBar({required this.flickProgressBar});

  @override
  Widget build(BuildContext context) {
    return FlickVideoProgressBar(
      flickProgressBarSettings: FlickProgressBarSettings(
        height: 5,
        handleRadius: 5,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        backgroundColor: Colors.transparent,
        bufferedColor: Colors.grey.withOpacity(0.5),
        playedColor: Colors.red,
        handleColor: Colors.red,
        // timeIndicator: FlickVideoProgressBarSettingsTimeIndicators(
        //   textStyle: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }
}
