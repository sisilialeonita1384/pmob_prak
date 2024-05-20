import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class donatePage6 extends StatefulWidget {
  final String title;

  const donatePage6({Key? key, required this.title}) : super(key: key);

  @override
  _donatePage6State createState() => _donatePage6State();
}

class _donatePage6State extends State<donatePage6> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          "Guardians of the Sea: Protecting Our Marine Environment Together!",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: CustomIconButton(
                        child: const Icon(Icons.arrow_back),
                        height: 35,
                        width: 35,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(child: Image.asset("images/marine.jpg")),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Text(
                    "Our marine environment is increasingly threatened by pollution, climate change, and human activities. However, by donating to marine conservation programs, we can help protect coral reefs, save endangered marine species, and restore disrupted marine ecosystems.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom), // Handle keyboard overlap
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return const SizedBox(
              height: 80,
              child: EnrollBottomSheetDonate(),
            );
          },
        ),
      ),
    );
  }
}

