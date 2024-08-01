

class DiaryEntry {
  final int? id;
  final String title;
  final String content;
  final DateTime dateTime;

  DiaryEntry({
    this.id,
    required this.title,
    required this.content,
    required this.dateTime,
  });

  factory DiaryEntry.fromJson(Map<String, dynamic> json) {
    return DiaryEntry(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
