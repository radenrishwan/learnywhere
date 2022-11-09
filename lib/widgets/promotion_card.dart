import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/utils/constant.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Stack(
          children: [
            Positioned(
              right: 14,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/illustrations/home/promotion.svg',
                height: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Over 100++ free courses\navailable now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: kMediumTextSize,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
