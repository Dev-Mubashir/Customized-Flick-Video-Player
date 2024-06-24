import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePage createState() => _ExplorePage();
}

class _ExplorePage extends State<ExplorePage> {
  late List<VideoPlayerController?>
      _controllers; // Make the controllers nullable
  var _isLoading = true;
  final int _currentIndex = 0;
  late List<String> _videos;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  void _init() async {
    _controllers = List<VideoPlayerController?>.filled(
        7, null); // Initialize controllers with null
    _videos = [
      'https://vod1cdn.tamashaweb.com:8087/testlinkvod/reels/c4b19b14-6441-4d4b-a4a9-c4b083e67f02/smil:mpfour.smil/playlist.m3u8',
      'https://vod2cdn.tamashaweb.com:8087/testlinkvod/reels/82b5fc0c-f3cd-4287-91d7-1d3d67fc7f09/smil:mpfour.smil/playlist.m3u8',
      'https://vod1cdn.tamashaweb.com:8087/testlinkvod/reels/9641862e-2672-4388-904c-54426882e545/smil:mpfour.smil/playlist.m3u8',
      'https://vod1cdn.tamashaweb.com:8087/testlinkvod/reels/c01bd51d-440e-43fc-a2ea-3e00a007a080/smil:mpfour.smil/playlist.m3u8',
      'https://vod2cdn.tamashaweb.com:8087/testlinkvod/reels/eb1fb3bb-484e-44f0-ad65-2a17ddb710f3/smil:mpfour.smil/playlist.m3u8',
      'https://vod2cdn.tamashaweb.com:8087/testlinkvod/reels/595be55e-5ea4-48f1-820b-18a2b133ae06/smil:mpfour.smil/playlist.m3u8',
      'https://vod2cdn.tamashaweb.com:8087/testlinkvod/reels/c26cf4ee-737d-432b-9bff-d8e2d6b93652/smil:mpfour.smil/playlist.m3u8',
    ];
    await _initVideos();
  }

  Future<void> _initVideo(String url, int initIndex) async {
    _controllers[initIndex] = VideoPlayerController.network(url);
    await _controllers[initIndex]!.initialize();
    await _controllers[initIndex]!.setLooping(true);
  }

  Future<void> _initVideos() async {
    var promises = <Future>[];
    promises.add(_initVideo(_videos[0], 0));
    promises.add(_initVideo(_videos[1], 1));
    promises.add(_initVideo(_videos[2], 2));
    promises.add(_initVideo(_videos[3], 3));
    promises.add(_initVideo(_videos[4], 4));
    promises.add(_initVideo(_videos[5], 5));
    promises.add(_initVideo(_videos[6], 6));
    await Future.wait(promises);
    _controllers[0]!.play();
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: AspectRatio(
                          aspectRatio: _controllers[index]!.value.aspectRatio,
                          child: VideoPlayer(_controllers[index]!)));
                },
                onPageChanged: (int i) async {
                  bool isNext = i > _currentIndex;
                  isNext
                      ? await _controllers[i - 1]!.pause()
                      : await _controllers[i + 1]!.pause();
                  await _controllers[i]!.play();
                },
              ),
      ),
    );
  }
}
