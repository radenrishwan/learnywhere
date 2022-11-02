import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/utils/constant.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                child: SvgPicture.asset(
                  'assets/illustrations/home/go.svg',
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
                    const Text(
                      'Basic Golang',
                      style: TextStyle(
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
                        const Text(
                          '24 Lessons',
                          style: TextStyle(
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
                children: const [
                  Icon(Icons.attach_money),
                  Text(
                    'Free',
                    style: TextStyle(
                      fontSize: kDefaultTextSize,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
