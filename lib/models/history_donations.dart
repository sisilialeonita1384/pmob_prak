import 'package:cloud_firestore/cloud_firestore.dart';

class DonationHistory {
  String title;
  DateTime registeredAt;
  double amount;
  String imageUrl;

  DonationHistory({
    required this.title,
    required this.registeredAt,
    required this.amount,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'registeredAt': Timestamp.fromDate(registeredAt),
      'amount': amount,
      'imageUrl': imageUrl,
    };
  }

  factory DonationHistory.fromMap(Map<String, dynamic> map) {
    return DonationHistory(
      title: map['title'] ?? '',
      registeredAt: (map['registeredAt'] as Timestamp).toDate(),
      amount: (map['amount'] as num).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
