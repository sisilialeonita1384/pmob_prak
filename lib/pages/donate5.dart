import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class donatePage5 extends StatefulWidget {
  final String title;

  const donatePage5({Key? key, required this.title}) : super(key: key);

  @override
  _donatePage5State createState() => _donatePage5State();
}

class _donatePage5State extends State<donatePage5> {

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
                          "Water for All: Be a Lifesaver in the Global Water Crisis!",
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
                Container(child: Image.asset("images/watercrisis_action.jpg")),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Text(
                    "The water crisis is a serious threat to human health and life in various parts of the world. By donating funds to clean water access and water resource management programs, we can help address the global water crisis and ensure that everyone has access to safe and clean water.",
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

