import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uts/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final PageController pageController;
  double currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> assetPaths = [
      'assets/illustrations/splash/welcome.svg',
      'assets/illustrations/splash/community.svg',
      'assets/illustrations/splash/access.svg',
    ];

    final List<String> title = ['Welcome, Student', 'Access Everywhere', 'Community'];
    final List<String> subtitle = [
      'Learning something what you  want without money and time',
      'You can learn everywhere and everytime you want.',
      'Ask everything to community and find out answer.',
    ];

    final splashWidget = List.generate(
      assetPaths.length,
      (index) {
        return _SplashWelcome(
          title: title[index],
          subtitle: subtitle[index],
          path: assetPaths[index],
          topAsset: index % 2 == 0 ? true : false,
        );
      },
    );

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: assetPaths.length,
        itemBuilder: (context, index) {
          pageController.addListener(() {
            setState(() {
              currentPage = pageController.page!;
            });
          });

          return splashWidget[index];
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: kBigPadding),
        height: 120,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                assetPaths.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    color: currentPage.round() == index
                        ? kPrimaryColor
                        : kPrimaryColor.withOpacity(
                            0.45,
                          ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: kBigPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text('Next'),
                  ),
                ),
                const SizedBox(width: kBigPadding),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Skip'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashWelcome extends StatelessWidget {
  final String path;
  final String title;
  final String subtitle;
  final bool topAsset;
  const _SplashWelcome({required this.path, required this.title, required this.subtitle, required this.topAsset});

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
                    bottom: -55,
                    right: -55,
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
