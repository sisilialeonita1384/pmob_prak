import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class donatePage1 extends StatefulWidget {
  final String title;

  const donatePage1({Key? key, required this.title}) : super(key: key);

  @override
  _donatePage1State createState() => _donatePage1State();
}

class _donatePage1State extends State<donatePage1> {

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
                          "Planting Hope, Preserving Nature: Donate Rp10,000 to Plant 1 Tree and Change the Future of the Environment!",
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
                Container(
                  child: Image.asset("images/deforestation_action.jpg"),
                ),
                const SizedBox(
                  height: 15,
                ),
                
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Text(
                    "By donating just Rp10,000, you can plant one tree that will be preserved for Indonesia's nature. Your donation will support the acquisition of tree seedlings, tree maintenance for at least 2 years, providing employment and additional income for local communities caring for the trees, as well as the advancement of Indonesian science and technology related to carbon absorption from the planted trees. There are so many benefits for our environment in our homeland. Click here to donate to the Tree Partnership.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ), 
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


