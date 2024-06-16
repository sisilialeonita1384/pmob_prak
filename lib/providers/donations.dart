import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../models/history_donations.dart';

class Donations with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Donation>> getDonations() async {
    List<Donation> donations = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('donations').get();
      querySnapshot.docs.forEach((doc) {
        donations.add(Donation(
          fullName: doc['fullName'],
          email: doc['email'],
          age: doc['age'],
          payment: doc['payment'],
          articleTitle: doc['articleTitle'],
        ));
      });
      return donations;
    } catch (error) {
      print('Error getting donations: $error');
      return [];
    }
  }

  Future<void> addDonation(
    String fullName,
    String email,
    String age,
    String payment,
    String articleTitle,
  ) async {
    try {
      await _firestore.collection('donations').add({
        'fullName': fullName,
        'email': email,
        'age': age,
        'payment': payment,
        'articleTitle': articleTitle,
      });

      // Save to donation_history
      final history = DonationHistory(
        title: articleTitle,
        registeredAt: DateTime.now(),
        amount: double.parse(payment),
        imageUrl: 'image_url_here', // Provide image URL here
      );
      await _firestore.collection('donation_history').add(history.toMap());

      notifyListeners(); // Ensure listeners are notified of changes
    } catch (error) {
      print('Error adding donation: $error');
    }
  }

  Future<List<DonationHistory>> getDonationHistory() async {
    try {
      final snapshot = await _firestore.collection('donation_history').get();
      return snapshot.docs
          .map((doc) => DonationHistory.fromMap(doc.data()))
          .toList();
    } catch (error) {
      print('Error getting donation history: $error');
      return [];
    }
  }
  getDonationArticles() {}
}


