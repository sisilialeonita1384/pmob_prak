import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Donation with ChangeNotifier {
  final String fullNameDonation;
  final String emailDonation;
  final String ageDonation;
  final String payment;

  Donation({
    required this.fullNameDonation,
    required  this.emailDonation,
    required this.ageDonation,
    required this.payment,
  });

  factory Donation.fromfirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Donation(
        fullNameDonation: 'fullNameDonation',
        emailDonation: 'emailDonation',
        ageDonation: 'ageDonation',
        payment: 'payment');
  }

  Map<String, dynamic> tofirestore() {
    return {
      if (fullNameDonation != null) "fullNameDonation": fullNameDonation,
      if (emailDonation != null) "emailDonation": emailDonation,
      if (ageDonation != null) "ageDonation": ageDonation,
      if (payment != null) "payment": payment,
    };
  }

  dataDonation() {}
}
