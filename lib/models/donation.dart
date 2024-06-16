class Donation {
  String fullName;
  String email;
  String age;
  String payment;
  String articleTitle;

  Donation({
    required this.fullName,
    required this.email,
    required this.age,
    required this.payment,
    required this.articleTitle,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'age': age,
      'payment': payment,
      'articleTitle': articleTitle,
    };
  }

  // Constructor from Firestore document data
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      age: map['age'] ?? '',
      payment: map['payment'] ?? '',
      articleTitle: map['articleTitle'] ?? '',
    );
  }
}
