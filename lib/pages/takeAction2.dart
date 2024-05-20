import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TakeAction2Page extends StatefulWidget {
  final String title;

  const TakeAction2Page({Key? key, required this.title}) : super(key: key);

  @override
  _TakeAction2PageState createState() => _TakeAction2PageState();
}

class _TakeAction2PageState extends State<TakeAction2Page> {

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
                        "Together, We Can Overcome: Aid Flood Victims Today!",
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
              Container(child: Image.asset("images/flood_action.jpg"),
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
                  "Join us in our mission to combat the devastating effects of floods and support vulnerable communities in their time of need. As floods continue to wreak havoc, claiming lives and destroying livelihoods, our volunteer team stands ready to make a difference. By lending your time and skills, you can be a crucial part of our efforts to provide emergency aid, bolster infrastructure, and raise awareness about flood prevention strategies. Together, we can be a beacon of hope amidst the chaos, offering solace and support to those in distress. Join us today and be a force for positive change in the face of adversity.",
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
                  "1. Make a Real Impact",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "2. Combat Climate Change",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "3. Support Disaster Relief",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                child: const Text(
                  "4. Promote Sustainable Solutions",
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

