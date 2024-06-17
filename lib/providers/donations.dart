import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../models/history_donations.dart';

class Donations with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Donations() {
    fixDonationHistoryData();
  }

  Future<void> fixDonationHistoryData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('donation_history').get();
      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        if (data['registeredAt'] is String) {
          DateTime registeredAt = DateTime.parse(data['registeredAt']);
          await doc.reference.update({
            'registeredAt': Timestamp.fromDate(registeredAt),
          });
        }

        if (data['amount'] == null) {
          await doc.reference.update({
            'amount': 0.0,
          });
        }
      }
    } catch (error) {
      print('Error fixing donation history data: $error');
    }
  }

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
  String imageUrl, // Tambahkan parameter ini
) async {
  try {
    await _firestore.collection('donations').add({
      'fullName': fullName,
      'email': email,
      'age': age,
      'payment': payment,
      'articleTitle': articleTitle,
      'imageUrl': imageUrl, // Simpan URL gambar
    });

    // Save to donation_history
    final double amount = double.tryParse(payment) ?? 0.0;
    final history = DonationHistory(
      title: articleTitle,
      registeredAt: DateTime.now(),
      amount: amount,
      imageUrl: imageUrl, // Gunakan URL gambar yang disediakan
    );
    await _firestore.collection('donation_history').add(history.toMap());

    notifyListeners(); // Pastikan listener diberitahu tentang perubahan
  } catch (error) {
    print('Error adding donation: $error');
    throw error; // Lepaskan error untuk ditangani di UI
  }
}



  Future<List<DonationHistory>> getDonationHistory() async {
    try {
      final snapshot = await _firestore.collection('donation_history').get();
      return snapshot.docs
          .map((doc) => DonationHistory.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      print('Error getting donation history: $error');
      return [];
    }
  }
}
