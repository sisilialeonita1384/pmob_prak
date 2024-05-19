import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreDatabase {
  // current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // get collection of posts from firebase
  final CollectionReference posts = FirebaseFirestore.instance.collection('Posts');

  // Upload image to Firebase Storage
  Future<String> uploadImage(File image) async {
    final Reference storageReference = FirebaseStorage.instance.ref().child('images/${user!.email}/${DateTime.now().millisecondsSinceEpoch}.jpg');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => null);
    String imageURL = await storageReference.getDownloadURL();
    return imageURL;
  }

  // posts a quotes
  Future<void> addPost(String quotes, String imagePath) async {
    // Upload image to Firebase Storage
    String imageURL = await uploadImage(File(imagePath));

    // Add post to Firestore
    await posts.add({
      'username': user!.displayName,
      'timestamp': Timestamp.now(),
      'quotes': quotes,
      'imageURL': imageURL,
    });
  }

  // read posts from database
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return postsStream;
  }
}
