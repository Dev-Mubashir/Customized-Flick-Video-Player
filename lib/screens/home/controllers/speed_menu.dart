import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class SpeedMenu extends StatefulWidget {
  final FlickManager flickManager; // Pass the FlickManager instance
  final double iconSize;
  SpeedMenu({Key? key, required this.flickManager, required this.iconSize})
      : super(key: key);

  @override
  State<SpeedMenu> createState() => SpeedMenuState();
}

class SpeedMenuState extends State<SpeedMenu> {
  double _selectedSpeed = 1.0; // Default speed

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildMenuItem(0.25),
        _buildMenuItem(0.5),
        _buildMenuItem(0.75),
        _buildMenuItem(1.0),
        _buildMenuItem(1.25),
        _buildMenuItem(1.5),
        _buildMenuItem(1.75),
        _buildMenuItem(2.0),
      ],
    );
  }

  ListTile _buildMenuItem(double speed) {
    return ListTile(
      title: Text('${speed}x'),
      onTap: () {
        widget.flickManager.flickControlManager?.setPlaybackSpeed(speed);
        setState(() {
          _selectedSpeed = speed; // Update the selected speed
        });
        Navigator.pop(context); // Close the bottom sheet
      },
      tileColor: speed == _selectedSpeed
          ? Colors.blue
          : null, // Highlight the selected speed
    );
  }
}
