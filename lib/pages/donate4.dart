import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class donatePage4 extends StatefulWidget {
  final String title;

  const donatePage4({Key? key, required this.title}) : super(key: key);

  @override
  _donatePage4State createState() => _donatePage4State();
}

class _donatePage4State extends State<donatePage4> {

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
                          "End Food Waste, Feed Hope: Donate to Sustainable Food Solutions!",
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
                Container(child: Image.asset("images/foodwaste.jpg")),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Text(
                    "Food waste is a barrier to our efforts to achieve food sustainability. By supporting more efficient food management programs through your donation, we can reduce food waste, provide food for those in need, and help create a more sustainable food system.",
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

