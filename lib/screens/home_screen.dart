import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uts/utils/constant.dart';
import 'package:uts/widgets/course_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> options = ['Discover', 'Categories', 'Playlist', 'Downloads'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 250),
        child: Container(
          padding: const EdgeInsets.all(kBigPadding),
          color: kPrimaryColor,
          child: AppBar(
            elevation: 0,
            titleSpacing: 0,
            actions: const [CircleAvatar()],
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, double.infinity),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome back,\nRaden Mohamad Rishwan",
                      style: TextStyle(
                        fontSize: kBigTextSize,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    TextField(
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontSize: kDefaultTextSize + 2,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: 'Search',
                        fillColor: Colors.white,
                        prefixIconColor: Colors.black,
                        focusColor: Colors.black,
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kBigPadding),
          child: Column(
            children: [
              Card(
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
                              'Over 1000++ free courses\navailable now',
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
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List<Widget>.generate(
                    options.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(options[index]),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          vertical: kBigPadding,
                        ),
                        pressElevation: 0,
                        selectedColor: Colors.transparent,
                        selected: _value == index,
                        labelStyle: TextStyle(
                          color: _value == index ? Colors.black : Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: kBigTextSize,
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? index : null;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              ...List.generate(
                5,
                (index) => const CourseCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
