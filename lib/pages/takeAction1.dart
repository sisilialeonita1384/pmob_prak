import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_icon_bottom.dart';
import '../widgets/enroll_bottom_sheet.dart.dart';


class TakeAction1Page extends StatefulWidget {
  final String title;

  const TakeAction1Page({Key? key, required this.title}) : super(key: key);

  @override
  _TakeAction1PageState createState() => _TakeAction1PageState();
}

class _TakeAction1PageState extends State<TakeAction1Page> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // Make the content scrollable
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
                        "Engaging Volunteers in the Fight Against Deforestation: Opportunities and Impact",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 17),
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
              Container(
                child: Image.asset("images/deforestation_action.jpg"),
                margin: EdgeInsets.only(top: 20),
              ),
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
                  "Welcome to our page addressing the issue of deforestation in Indonesia! We invite you to join our volunteer movement focused on forest and environmental conservation. Deforestation, referring to the extensive reduction of forests, has become a serious issue in Indonesia, impacting biodiversity loss, disrupting ecosystems, and contributing to climate change.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "Why Join as a Volunteer?",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "1. Forest Conservation Mission",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "2. Combatting Deforestation",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "3. Addressing Palm Oil Impact",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                child: const Text(
                  "4. Fighting Illegal Logging",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom), // Handle keyboard overlap
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
