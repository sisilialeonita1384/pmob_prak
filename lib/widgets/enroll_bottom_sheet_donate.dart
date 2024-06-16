import 'package:education_app/pages/formdonate.dart';
import 'package:flutter/material.dart';
import 'custom_icon_bottom.dart';

class EnrollBottomSheetDonate extends StatefulWidget {
  final String title; 

  const EnrollBottomSheetDonate({Key? key, required this.title}) : super(key: key);

  @override
  _EnrollBottomSheetDonateState createState() => _EnrollBottomSheetDonateState();
}

class _EnrollBottomSheetDonateState extends State<EnrollBottomSheetDonate> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonateFormPage(title: widget.title),
                  ),
                );
              },
              color: const Color.fromRGBO(78, 138, 103, 1),
              height: 45,
              width: 45,
              child: const Text(
                "Take Action",
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
