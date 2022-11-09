import 'package:flutter/material.dart';
import 'package:uts/models/video.dart';
import 'package:uts/utils/constant.dart';

class VideoCard extends StatelessWidget {
  final int index;
  final Video video;
  final VoidCallback onTap;

  const VideoCard({
    super.key,
    required this.index,
    required this.video,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            kDefaultBorderRadius,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            color: Colors.white,
          ),
          height: 70,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: kDefaultPadding),
          child: Row(
            children: [
              Text(
                index.toString(),
                style: const TextStyle(
                  fontSize: kBigTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: kDefaultPadding - 2),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      style: const TextStyle(
                        fontSize: kMediumTextSize - 2,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(video.duration),
                  ],
                ),
              ),
              const Icon(Icons.play_arrow_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
