import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/utils/constant.dart';

class SplashWidget extends StatelessWidget {
  final String path;
  final String title;
  final String subtitle;
  final bool topAsset;
  const SplashWidget({
    Key? key,
    required this.path,
    required this.title,
    required this.subtitle,
    required this.topAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            topAsset
                ? Positioned(
                    top: -55,
                    left: -55,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  )
                : Positioned(
                    bottom: MediaQuery.of(context).size.width * 0.46,
                    left: MediaQuery.of(context).size.width * 0.12,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
            topAsset
                ? Positioned(
                    top: MediaQuery.of(context).size.width * 0.5,
                    left: MediaQuery.of(context).size.width * 0.5,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  )
                : Positioned(
                    top: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.8,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(90),
                      ),
                    ),
                  ),
            Center(
              child: topAsset
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          path,
                          height: 300,
                        ),
                        const SizedBox(height: kBigPadding),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: kMediumTextSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  fontSize: kMediumTextSize - 2,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: kMediumTextSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  fontSize: kMediumTextSize - 2,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(height: kBigPadding),
                              SvgPicture.asset(
                                path,
                                height: 300,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
