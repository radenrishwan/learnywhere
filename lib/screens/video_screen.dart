import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:uts/models/video.dart';
import 'package:uts/utils/constant.dart';

class VideoScreen extends StatelessWidget {
  final Video video;

  const VideoScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer.network(
                  video.url,
                  betterPlayerConfiguration: const BetterPlayerConfiguration(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    fullScreenByDefault: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    video.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kMediumTextSize + 2,
                    ),
                  ),
                  Text("Duration : ${video.duration}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
