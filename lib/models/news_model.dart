class StoryModel {
  final int id;
  final String title;
  final String? url;
  final int score;
  final String by;
  final int time;
  final int? descendants;

  StoryModel({
    required this.id,
    required this.title,
    this.url,
    required this.score,
    required this.by,
    required this.time,
    this.descendants,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      title: json['title'] ?? 'No Title',
      url: json['url'],
      score: json['score'] ?? 0,
      by: json['by'] ?? 'Unknown',
      time: json['time'] ?? 0,
      descendants: json['descendants'],
    );
  }
}
