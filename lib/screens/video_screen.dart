import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:uts/models/video.dart';
import 'package:uts/utils/constant.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoScreen extends StatefulWidget {
  final Video video;

  const VideoScreen({super.key, required this.video});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  bool isLandscape = false;
  late final YoutubePlayerController controller;

  @override
  void initState() {
    if (widget.video.url.contains("youtu.be")) {
      final id = YoutubePlayerController.convertUrlToId(widget.video.url);
      controller = YoutubePlayerController()
        ..onInit = () {
          controller.loadVideoById(videoId: id ?? '');
        };
    }

    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          isLandscape = true;
        } else {
          isLandscape = false;
        }

        return Scaffold(
          appBar: isLandscape
              ? PreferredSize(
                  preferredSize: const Size(0, 0),
                  child: Container(),
                )
              : AppBar(
                  title: Text(
                    widget.video.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.video.url.contains("youtu.be")
                    ? YoutubePlayerScaffold(
                        controller: controller,
                        aspectRatio: 16 / 9,
                        builder: (context, player) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              player,
                              Padding(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.video.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: kMediumTextSize + 2,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.enterFullScreen();
                                          },
                                          child: const Text('Full Screen'),
                                        ),
                                      ],
                                    ),
                                    Text("Duration : ${widget.video.duration}"),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BetterPlayer.network(
                              widget.video.url,
                              betterPlayerConfiguration: const BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                                autoPlay: true,
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
                                  widget.video.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: kMediumTextSize + 2,
                                  ),
                                ),
                                Text(
                                  "Duration : ${widget.video.duration}",
                                ),
                              ],
                            ),
                          )
                        ],
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
