import 'package:uts/models/video.dart';

class Section {
  final String title;
  final List<Video> video;

  const Section({
    required this.title,
    required this.video,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      video: List<Video>.from(
        json['video'].map(
          (video) => Video.fromJson(video),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'video': video,
    };
  }
}
