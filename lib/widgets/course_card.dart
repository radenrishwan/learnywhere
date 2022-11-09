import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/models/course.dart';
import 'package:uts/utils/constant.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;
  const CourseCard({super.key, required this.onTap, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Image.network(
                    course.thumbnail,
                    height: 80,
                  ),
                ),
                const SizedBox(width: kDefaultPadding + 2),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: const TextStyle(
                          fontSize: kMediumTextSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/illustrations/icon/video.svg',
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${course.sections.length} Sections",
                            style: const TextStyle(
                              fontSize: kDefaultTextSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.attach_money),
                    Text(
                      (course.price == "0") ? "Free" : course.price,
                      style: const TextStyle(
                        fontSize: kDefaultTextSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
