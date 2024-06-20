import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../models/edu_article.dart';

class Articles with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addArticle(
      String nameArticle, String imageUrl, String description) async {
    try {
      await _firestore.collection('articles').add({
        'nameArticle': nameArticle,
        'image': imageUrl,
        'description': description,
      });
      notifyListeners();
    } catch (error) {
      print('Error adding article: $error');
      throw error;
    }
  }

  Future<String> uploadImage(Uint8List imageData) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putData(imageData);
      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();

      Uri uri = Uri.parse(downloadUrl);
      String generalUrl = '${uri.scheme}://${uri.host}${uri.path}?alt=media';

      return generalUrl;
    } catch (error) {
      print('Error uploading image: $error');
      throw error;
    }
  }

  Future<List<Artikel>> getArticles() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('articles').get();
      return querySnapshot.docs
          .map((doc) => Artikel.fromFirestore(doc))
          .toList();
    } catch (error) {
      print('Error getting articles: $error');
      return [];
    }
  }
}
