import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:tamashaaa/screens/home/view/thumbnails.dart';
import 'package:tamashaaa/screens/home/view/widgets/carousal.dart';
import 'package:tamashaaa/utils/colors.dart';
import 'package:tamashaaa/screens/home/view/jsonconversion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late FlickManager flickManager;

  @override
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
          CarouselExample(),
          FutureBuilder<List<dynamic>>(
            future: loadmovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieList(movies: snapshot.data!);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return const Text('Error loading movies');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
