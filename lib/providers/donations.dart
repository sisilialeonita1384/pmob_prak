import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/donation.dart';
import 'package:flutter/material.dart';

class Donations with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Donation>> getDonations() async {
    List<Donation> donations = [];
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('volunteers').get();
      querySnapshot.docs.forEach((doc) {
        donations.add(Donation(
          fullNameDonation: doc['fullNameDonation'],
          emailDonation: doc['emailDonation'],
          ageDonation: doc['ageDonation'],
          payment: doc['payment'],
        ));
      });
      return donations;
    } catch (error) {
      print('Error getting volunteers: $error');
      return []; 
    }
  }

  Future<void> addDonation(
    String fullNameDonation,
    String emailDonation,
    String ageDonation,
    String payment,
  ) async {
    try {
      await _firestore.collection('volunteers').add({
        'fullName': fullNameDonation,
        'email': emailDonation,
        'age': ageDonation,
        'payment': payment,
      });
      notifyListeners();
    } catch (error) {
      // Handle error
      print('Error adding volunteer: $error');
    }
  }
}
