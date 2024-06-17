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
    String imageUrl,
  ) async {
    try {
      // Menambahkan volunteer ke koleksi 'volunteers'
      DocumentReference volunteerRef = await _firestore.collection('volunteers').add({
        'fullName': fullName,
        'email': email,
        'age': age,
        'province': province,
        'city': city,
        'reason': reason,
        'articleTitle': articleTitle,
        'imageUrl': imageUrl,
      });

      // Menyimpan riwayat volunteer ke koleksi 'volunteer_history'
      final history = VolunteerHistory(
        title: articleTitle,
        registeredAt: DateTime.now(),
        imageUrl: imageUrl,
      );
      await _firestore.collection('volunteer_history').add(history.toMap());

      // Menyimpan riwayat volunteer ke koleksi 'users' berdasarkan email pengguna
      await _firestore.collection('users').doc(email).collection('volunteer_history').add(history.toMap());

      notifyListeners(); // Pastikan listener diberitahu tentang perubahan
    } catch (error) {
      print('Error adding volunteer: $error');
      throw error; // Lepaskan error untuk ditangani di UI
    }
  }

  Future<List<VolunteerHistory>> getVolunteerHistory(String userEmail) async {
  try {
    final snapshot = await _firestore.collection('users').doc(userEmail).collection('volunteer_history').get();
    return snapshot.docs.map((doc) => VolunteerHistory.fromMap(doc.data())).toList();
  } catch (error) {
    print('Error getting volunteer history: $error');
    return [];
  }
}

  

  getVolunteerArticles() {}
}
