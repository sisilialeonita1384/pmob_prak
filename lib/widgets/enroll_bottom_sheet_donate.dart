import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'custom_icon_bottom.dart'; // Pastikan import custom_icon_bottom.dart sesuai dengan struktur Anda
import 'package:education_app/pages/formdonate.dart'; // Sesuaikan dengan path file DonateFormPage

class EnrollBottomSheetDonate extends StatelessWidget {
  final String title;
  final String imageUrl; // Tambahkan properti imageUrl

  const EnrollBottomSheetDonate({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: CustomIconButton(
              onTap: () {
                // Navigasi ke halaman formulir donasi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonateFormPage(
                      title: title,
                      imageUrl: imageUrl, // Teruskan imageUrl ke DonateFormPage
                    ),
                  ),
                );
              },
              color: const Color.fromRGBO(78, 138, 103, 1),
              height: 45,
              width: 45,
              child: const Text(
                "Donate Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
