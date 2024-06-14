import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Artikel with ChangeNotifier {
  final String nameArticle;
  final String image;
  final String description;

  Artikel({
    required this.nameArticle,
    required this.image,
    required this.description,
  });

  factory Artikel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Artikel(
      nameArticle: data['nameArticle'],
      image: data['image'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nameArticle': nameArticle,
      'image': image,
      'description': description,
    };
  }
}
