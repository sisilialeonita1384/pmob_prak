import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StoreData with ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<String> saveData(String uid, Uint8List file) async {
    try {
      String imageUrl = await uploadImage(file);

      // Use a transaction to ensure atomicity
      return await _firestore.runTransaction((transaction) async {
        QuerySnapshot querySnapshot = await _firestore.collection("users").where("uid", isEqualTo: uid).get();
        
        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot userDoc = querySnapshot.docs.first;
          transaction.update(userDoc.reference, {"photoUrl": imageUrl});
          return "Success";
        } else {
          return "User not found";
        }
      });
    } catch (err) {
      print('Error saving data: $err');
      return "Error: $err";
    }
  }
}
