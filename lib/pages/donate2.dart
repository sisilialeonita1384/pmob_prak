import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class donatePage2 extends StatefulWidget {
  final String title;

  const donatePage2({Key? key, required this.title}) : super(key: key);

  @override
  _donatePage2State createState() => _donatePage2State();
}

class _donatePage2State extends State<donatePage2> {

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
                          "Transforming Tomorrow: Join the Fight Against Climate Change!",
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
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset("images/climatechange.png", width: MediaQuery.of(context).size.width)),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Text(
                    "Climate change is a global crisis that affects us all, but with small steps like donating, we can change the course of the future. By donating funds to accelerate the adoption of renewable energy and reduce carbon emissions, we not only help protect the environment but also improve the welfare of communities worldwide. Let's together be part of the solution to this climate change.",
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


