import 'package:uts/models/section.dart';

class Course {
  final String thumbnail;
  final String title;
  final String rating;
  final String price;
  final String previewUrl;
  final String sylabus;
  final List<Section> sections;

  const Course({
    required this.thumbnail,
    required this.title,
    required this.rating,
    required this.price,
    required this.previewUrl,
    required this.sylabus,
    required this.sections,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      thumbnail: json['thumbnail'],
      title: json['title'],
      rating: json['rating'].toString(),
      price: json['price'].toString(),
      previewUrl: json['previewUrl'],
      sylabus: json['sylabus'],
      sections: List<Section>.from(
        json['sections'].map(
          (section) => Section.fromJson(section),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'rating': rating,
      'price': price,
      'previewUrl': previewUrl,
      'sylabus': sylabus,
    };
  }

  @override
  String toString() {
    return """
      thumbnail: $thumbnail,
      title: $title,
      rating: $rating,
      price: $price,
      previewUrl: $previewUrl,
      sylabus: $sylabus,
      sections: $sections,
    """;
  }
}
