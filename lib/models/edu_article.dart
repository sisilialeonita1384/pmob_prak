import 'package:cloud_firestore/cloud_firestore.dart';

class Artikel {
  final String id;
  final String nameArticle;
  final String image;
  final String description;

  Artikel({
    required this.id,
    required this.nameArticle,
    required this.image,
    required this.description,
  });

  factory Artikel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Artikel(
      id: doc.id,
      nameArticle: data['nameArticle'] ?? '',
      image: data['image'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
