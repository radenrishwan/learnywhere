import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  final String url;
  final String title;

  const VideoScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer.network(
            url,
            betterPlayerConfiguration: const BetterPlayerConfiguration(
              aspectRatio: 16 / 9,
              autoPlay: true,
              fullScreenByDefault: true,
            ),
          ),
        ),
      ),
    );
  }
}
