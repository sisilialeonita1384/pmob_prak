import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TakeAction5Page extends StatefulWidget {
  final String title;

  const TakeAction5Page({Key? key, required this.title}) : super(key: key);

  @override
  _TakeAction5PageState createState() => _TakeAction5PageState();
}

class _TakeAction5PageState extends State<TakeAction5Page> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 45),
                      child: Text(
                        "Join Volunteer to Preserve Marine Environments!",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 17),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
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
              Container(child: Image.asset("images/marine_action.jpg"),
              margin: EdgeInsets.only(top: 20),),
              Container(
                margin: EdgeInsets.all(20),
                child: const Text(
                  "What can we do?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  " Marine ecosystems play a critical role in maintaining the health of our planet, from regulating climate patterns to supporting diverse life forms. However, rampant pollution, overfishing, habitat destruction, and the impacts of climate change pose significant threats to marine environments globally.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "Why Join as a Volunteer   ?",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "1. Make a Tangible Difference",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "2. Raise Awareness",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "3. Participate in Restoration Efforts",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "4. Participate in Restoration Efforts",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "5. Educate and Inspire",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                child: const Text(
                  "6. Connect with Like-minded Individuals",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ), 
            ],
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

