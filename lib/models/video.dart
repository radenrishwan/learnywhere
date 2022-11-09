class Video {
  final String title;
  final String duration;
  final String url;

  const Video({
    required this.title,
    required this.duration,
    required this.url,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title'],
      duration: json['duration'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'duration': duration,
      'url': url,
    };
  }
}
