import 'package:better_player/better_player.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:uts/models/course.dart';
import 'package:uts/utils/constant.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  const CourseScreen({super.key, required this.course});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Course course = widget.course;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text(course.title),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: kPrimaryColor,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kBackgroudColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultBorderRadius * 2.5),
                topRight: Radius.circular(kDefaultBorderRadius * 2.5),
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(kBigPadding),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          course.thumbnail,
                          height: 100,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.attach_money, size: 16),
                        Text(
                          (course.price == "0") ? "Free" : course.price,
                          style: const TextStyle(fontSize: kMediumTextSize),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star_border),
                                Text(course.rating),
                              ],
                            ),
                            Text("${course.sections.length} Sections"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const Text(
                      'Preview',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: kMediumTextSize,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: BetterPlayer.network(
                          course.previewUrl,
                          betterPlayerConfiguration: BetterPlayerConfiguration(
                            aspectRatio: 16 / 9,
                            autoPlay: false, // TODO: change later
                            errorBuilder: (context, errorMessage) {
                              return Center(
                                child: Text(
                                  errorMessage ?? 'Error Occured',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const Text(
                      'Course Sylabus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: kMediumTextSize,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    ExpandableText(
                      course.sylabus,
                      expandText: 'show more',
                      collapseText: 'show less',
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      linkColor: kPrimaryColor,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const Text(
                      'Section 1 - Introduction',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: kDefaultTextSize,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Card(
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
                            const Text(
                              '1',
                              style: TextStyle(
                                fontSize: kBigTextSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding - 2),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Introduction',
                                    style: TextStyle(
                                      fontSize: kMediumTextSize - 2,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text('12:30'),
                                ],
                              ),
                            ),
                            const Icon(Icons.play_arrow_outlined),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
