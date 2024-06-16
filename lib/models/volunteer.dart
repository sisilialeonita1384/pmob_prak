import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Volunteer {
  final String fullName;
  final String email;
  final String age;
  final String province;
  final String city;
  final String reason;
  final String articleTitle; // Properti baru

  Volunteer({
    required this.fullName,
    required this.email,
    required this.age,
    required this.province,
    required this.city,
    required this.reason,
    required this.articleTitle, // Properti baru
  });


  factory Volunteer.fromfirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Volunteer(
        fullName: 'fullName',
        email: 'email',
        age: 'age',
        province: 'province',
        city: 'city',
        reason: 'reason',
        articleTitle: 'articleTitle');
  }

  Map<String, dynamic> tofirestore() {
    return {
      if (fullName != null) "fullName": fullName,
      if (age != null) "age": age,
      if (province != null) "province": province,
      if (city != null) "city": city,
      if (reason != null) "reason": reason,
      if (articleTitle != null) "articleTitle": articleTitle
    };
  }

  dataVolunteer() {}
}
