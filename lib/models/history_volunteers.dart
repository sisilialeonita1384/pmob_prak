class VolunteerHistory {
  final String title;
  final DateTime registeredAt;
  final String imageUrl;

  VolunteerHistory({
    required this.title,
    required this.registeredAt,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'registeredAt': registeredAt.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }

  factory VolunteerHistory.fromMap(Map<String, dynamic> map) {
    return VolunteerHistory(
      title: map['title'],
      registeredAt: DateTime.parse(map['registeredAt']),
      imageUrl: map['imageUrl'],
    );
  }
}
