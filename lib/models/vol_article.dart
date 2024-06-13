import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ArtikelVolunteer with ChangeNotifier {
  final String nameArticle;
  final String image;
  final String description;

  ArtikelVolunteer({
    required this.nameArticle,
    required  this.image,
    required this.description,
  });

  factory ArtikelVolunteer.fromfirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ArtikelVolunteer(
        nameArticle: 'nameArticle',
        image: 'image',
        description: 'description'
        );
  }

  Map<String, dynamic> tofirestore() {
    return {
      if (nameArticle != null) "nameArticle": nameArticle,
      if (image != null) "image": image,
      if (description != null) "description": description,
    };
  }

  dataArticle() {}
}
