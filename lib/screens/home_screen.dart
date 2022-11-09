import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts/models/course.dart';
import 'package:uts/models/section.dart';
import 'package:uts/models/video.dart';
import 'package:uts/screens/course_screen.dart';
import 'package:uts/utils/constant.dart';
import 'package:uts/widgets/course_card.dart';
import 'package:uts/widgets/drawer.dart';
import 'package:uts/widgets/promotion_card.dart';

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
                        fontSize: kBigTextSize - 2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kBigPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PromotionCard(),
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
              const Text(
                'Popular Courses',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: kMediumTextSize,
                ),
              ),
              FutureBuilder(
                future: Future.delayed(
                  const Duration(milliseconds: Duration.millisecondsPerSecond),
                  () {
                    return rootBundle.loadString('assets/data/courses.json');
                  },
                ),
                builder: (context, snapshot) {
                  final List<Course> courses = [];

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasData) {
                    final List<dynamic> data = jsonDecode(snapshot.data as String);

                    for (var element in data) {
                      final section = element['sections'];

                      // TODO: change and fix tojson function on model class
                      courses.add(
                        Course(
                          thumbnail: element['thumbnail'].toString(),
                          title: element['title'].toString(),
                          rating: element['rating'].toString(),
                          price: element['price'].toString(),
                          previewUrl: element['previewUrl'].toString(),
                          sylabus: element['sylabus'].toString(),
                          sections: List.generate(
                            (section as List).length,
                            (index) {
                              final video = section[index]['videos'];
                              return Section(
                                title: section[index]['title'],
                                video: List.generate(
                                  (video as List).length,
                                  (index) {
                                    return Video(
                                      title: video[index]['title'],
                                      url: video[index]['url'],
                                      duration: video[index]['duration'],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      courses.length,
                      (index) => CourseCard(
                        course: courses[index],
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CourseScreen(
                                course: courses[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
