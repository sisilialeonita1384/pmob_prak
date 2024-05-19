import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/constants/color.dart';
import 'package:education_app/widgets/lesson_card.dart';
import 'package:education_app/models/lesson.dart';

class donatePage1 extends StatefulWidget {
  final String title;

  const donatePage1({Key? key, required this.title}) : super(key: key);

  @override
  _donatePage1State createState() => _donatePage1State();
}

class _donatePage1State extends State<donatePage1> {
  bool isButtonSection1 = true;
  bool isButtonSection2 = true;
  bool isButtonSection3 = true;
  bool isButtonSection4 = true;
  double bottomSheetPosition = 0;

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
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            color: isButtonSection1
                                ? Color.fromRGBO(78, 138, 103, 50)
                                : Color.fromRGBO(78, 138, 103, 50).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isButtonSection1 = false;
                                  isButtonSection2 = true;
                                  isButtonSection3 = true;
                                  isButtonSection4 = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                child: const Text(
                                  "Rp 100.000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: isButtonSection2
                                ? Color.fromRGBO(78, 138, 103, 50)
                                : Color.fromRGBO(78, 138, 103, 50).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isButtonSection2 = false;
                                  isButtonSection1 = true;
                                  isButtonSection3 = true;
                                  isButtonSection4 = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                child: const Text(
                                  "Rp 300.000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            color: isButtonSection3
                                ? Color.fromRGBO(78, 138, 103, 50)
                                : Color.fromRGBO(78, 138, 103, 50).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isButtonSection3 = false;
                                  isButtonSection1 = true;
                                  isButtonSection2 = true;
                                  isButtonSection4 = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                child: const Text(
                                  "Rp 500.000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: isButtonSection4
                                ? Color.fromRGBO(78, 138, 103, 50)
                                : Color.fromRGBO(78, 138, 103, 50).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isButtonSection4 = false;
                                  isButtonSection1 = true;
                                  isButtonSection2 = true;
                                  isButtonSection3 = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                child: const Text(
                                  "Rp 700.000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ], 
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
              child: EnrollBottomSheet(),
            );
          },
        ),
      ),
    );
  }
}


class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
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
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomIconButton(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>  EnrollBottomSheet(),
                );
              },
              color: Color.fromRGBO(78, 138, 103, 50),
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
          )
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Center(child: child),
        onTap: onTap,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ),
        ],
      ),
    );
  }
}
