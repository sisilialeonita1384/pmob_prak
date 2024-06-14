import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:education_app/models/edu_article.dart'; 

class Articles with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

Future<List<Artikel>> getArticles() async {
  List<Artikel> articles = [];
  try {
    QuerySnapshot querySnapshot = await _firestore.collection('articles').get();
    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;
      articles.add(Artikel(
        nameArticle: data['nameArticle'],
        image: data['image'],
        description: data['description'],
      ));
    });
    return articles;
  } catch (error) {
    print('Error getting articles: $error');
    return [];
  }
}


  Future<void> addArticle(
    String nameArticle,
    String image,
    String description,
  ) async {
    try {
      await _firestore.collection('articles').add({
        'nameArticle': nameArticle,
        'image': image,
        'description': description,
      });
      notifyListeners();
    } catch (error) {
      print('Error adding article: $error');
    }
  }

  Future<String> uploadImage(Uint8List imageData) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putData(imageData);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      print('Error uploading image: $error');
      throw error;
    }
  }
}
