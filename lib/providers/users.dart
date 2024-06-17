// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:education_app/models/history_donations.dart';
// import 'package:education_app/models/history_volunteers.dart';
// import 'package:flutter/material.dart';

// class Users with ChangeNotifier {
//   String? _currentUserId;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//    // Getter untuk mengambil currentUserId
//   String? get currentUserId => _currentUserId;


//   // Simpan riwayat sukarelawan ke pengguna
//   Future<void> addVolunteerHistoryToUser(String userId, VolunteerHistory history) async {
//     try {
//       final userRef = _firestore.collection('users').doc(userId);
//       await userRef.update({
//         'volunteerHistory': FieldValue.arrayUnion([history.toMap()]),
//       });
//       print('Volunteer history added to user successfully');
//     } catch (error) {
//       print('Failed to add volunteer history to user: $error');
//       throw error;
//     }
//   }

//   // Simpan riwayat donasi ke pengguna
//   Future<void> addDonationHistoryToUser(String userId, DonationHistory history) async {
//     try {
//       final userRef = _firestore.collection('users').doc(userId);
//       await userRef.update({
//         'donationHistory': FieldValue.arrayUnion([history.toMap()]),
//       });
//       print('Donation history added to user successfully');
//     } catch (error) {
//       print('Failed to add donation history to user: $error');
//       throw error;
//     }
//   }
// }
