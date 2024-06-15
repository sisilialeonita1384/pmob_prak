import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import Firebase storage
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class DonationArticles extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(Uint8List image) async {
    // Create a unique file name for the image
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      // Upload image to Firebase Storage
      await _storage.ref('article_images/$fileName.jpg').putData(image);

      // Get download URL for the image
      String imageUrl = await _storage.ref('article_images/$fileName.jpg').getDownloadURL();
      return imageUrl;
    } catch (error) {
      throw error;
    }
  }

  Future<void> addArticle(String text, {
    required String title,
    required String imageUrl,
    required String description,
  }) async {
    try {
      // Add article data to Firestore
      await _firestore.collection('articles').add({
        'title': title,
        'imageUrl': imageUrl,
        'description': description,
      });
      notifyListeners(); // Notify listeners of state change
    } catch (error) {
      throw error;
    }
  }
}
