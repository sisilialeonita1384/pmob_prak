import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/don_article.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DonationArticles with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<ArtikelDonasi>> getDonationArticles() async {
    List<ArtikelDonasi> don_articles = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('don_articles').get();
      querySnapshot.docs.forEach((doc) {
        don_articles.add(ArtikelDonasi(
          nameArticle: doc['nameArticle'],
          image: doc['image'],
          description: doc['description'],
        ));
      });
      return don_articles;
    } catch (error) {
      print('Error getting don_articles: $error');
      return [];
    }
  }

  Future<void> addArticle(
    String nameArticle,
    String image,
    String description,
  ) async {
    try {
      await _firestore.collection('don_articles').add({
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
