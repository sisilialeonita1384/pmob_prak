import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/history_volunteers.dart';
import 'package:flutter/material.dart';
import '../models/volunteer.dart';

class Volunteers with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Volunteer>> getVolunteers() async {
    List<Volunteer> volunteers = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('volunteers').get();
      querySnapshot.docs.forEach((doc) {
        volunteers.add(Volunteer(
          fullName: doc['fullName'],
          email: doc['email'],
          age: doc['age'],
          province: doc['province'],
          city: doc['city'],
          reason: doc['reason'],
          articleTitle: doc['articleTitle'], // Properti baru
        ));
      });
      return volunteers;
    } catch (error) {
      print('Error getting volunteers: $error');
      return []; 
    }
  }

  Future<void> addVolunteer(
  String fullName,
  String email,
  String age,
  String province,
  String city,
  String reason,
  String articleTitle,
) async {
  try {
    await _firestore.collection('volunteers').add({
      'fullName': fullName,
      'email': email,
      'age': age,
      'province': province,
      'city': city,
      'reason': reason,
      'articleTitle': articleTitle,
    });

    // Save to volunteer_history
    final history = VolunteerHistory(
      title: articleTitle,
      registeredAt: DateTime.now(),
      imageUrl: 'image_url_here', // Provide image URL here
    );
    await _firestore.collection('volunteer_history').add(history.toMap());

    notifyListeners(); // Ensure listeners are notified of changes
  } catch (error) {
    print('Error adding volunteer: $error');
  }
}

  Future<List<VolunteerHistory>> getVolunteerHistory() async {
    final snapshot = await _firestore.collection('volunteer_history').get();
    return snapshot.docs.map((doc) => VolunteerHistory.fromMap(doc.data())).toList();
  }

  getVolunteerArticles() {}
}
