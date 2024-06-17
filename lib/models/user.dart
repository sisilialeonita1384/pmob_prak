import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/history_donations.dart';
import 'package:education_app/models/history_volunteers.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final List<VolunteerHistory> volunteerHistory;
  final List<DonationHistory> donationHistory;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.volunteerHistory,
    required this.donationHistory,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    final volunteerHistory = (data['volunteerHistory'] as List<dynamic>?)
        ?.map((entry) => VolunteerHistory.fromMap(entry))
        .toList() ?? [];

    final donationHistory = (data['donationHistory'] as List<dynamic>?)
        ?.map((entry) => DonationHistory.fromMap(entry))
        .toList() ?? [];

    return User(
      uid: doc.id,
      username: data['username'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      volunteerHistory: volunteerHistory,
      donationHistory: donationHistory,
    );
  }
}
