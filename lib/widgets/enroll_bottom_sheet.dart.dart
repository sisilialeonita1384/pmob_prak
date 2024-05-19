import 'package:education_app/pages/formvolunteer.dart';
import 'package:flutter/material.dart';
import 'custom_icon_bottom.dart';


class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
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
                // Navigasi ke halaman formulir volunteer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VolunteerFormPage()),
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
