import 'package:education_app/pages/formdonate.dart';
import 'package:flutter/material.dart';
import 'custom_icon_bottom.dart';


class EnrollBottomSheetDonate extends StatefulWidget {
  const EnrollBottomSheetDonate({Key? key}) : super(key: key);

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
          CustomIconButton(
            onTap: () {},
            height: 45,
            width: 45,
            child: const Icon(
              Icons.bookmark,
              color: Colors.pink,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomIconButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonateFormPage()),
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
