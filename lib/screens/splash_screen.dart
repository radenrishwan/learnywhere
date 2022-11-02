import 'package:flutter/material.dart';
import 'package:uts/screens/login_screen.dart';
import 'package:uts/utils/constant.dart';
import 'package:uts/widgets/splash_widget.dart';

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
        return SplashWidget(
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
                  height: 12,
                  width: 12,
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
                      if (currentPage == assetPaths.length - 1) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: kMediumTextSize - 2),
                      child: (currentPage == assetPaths.length - 1)
                          ? const Text(
                              'Get Started',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'Next',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: kBigPadding),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: kMediumTextSize - 2),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
