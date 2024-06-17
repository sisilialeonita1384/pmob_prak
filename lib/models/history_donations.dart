import 'package:cloud_firestore/cloud_firestore.dart';

class DonationHistory {
  final String title;
  final DateTime registeredAt;
  final double amount;
  final String imageUrl;

  DonationHistory({
    required this.title,
    required this.registeredAt,
    required this.amount,
    required this.imageUrl,
  });

  factory DonationHistory.fromMap(Map<String, dynamic> data) {
    // Mengonversi String ke Timestamp jika perlu
    final dynamic registeredAtData = data['registeredAt'];
    DateTime registeredAt;

    if (registeredAtData is Timestamp) {
      registeredAt = registeredAtData.toDate();
    } else if (registeredAtData is String) {
      registeredAt = DateTime.parse(registeredAtData);
    } else {
      throw TypeError();
    }

    // Menangani nilai null untuk 'amount'
    final dynamic amountData = data['amount'];
    double amount;
    if (amountData != null) {
      amount = amountData.toDouble();
    } else {
      amount = 0.0; // Atau nilai default lainnya
    }

    return DonationHistory(
      title: data['title'],
      registeredAt: registeredAt,
      amount: amount,
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'registeredAt': Timestamp.fromDate(registeredAt),
      'amount': amount,
      'imageUrl': imageUrl,
    };
  }
}
