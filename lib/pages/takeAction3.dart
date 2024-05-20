import 'package:education_app/widgets/custom_icon_bottom.dart';
import 'package:education_app/widgets/enroll_bottom_sheet.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TakeAction3Page extends StatefulWidget {
  final String title;

  const TakeAction3Page({Key? key, required this.title}) : super(key: key);

  @override
  _TakeAction3PageState createState() => _TakeAction3PageState();
}

class _TakeAction3PageState extends State<TakeAction3Page> {

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
                        "Join the Movement: Empower Communities, Transform Lives in the Global Clean Water Crisis!",
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
              Container(child: Image.asset("images/watercrisis_action.jpg"),
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
                  " Join our volunteer team in the fight against the global clean water crisis! With millions worldwide lacking access to safe and clean drinking water, your involvement is crucial in implementing innovative solutions, raising awareness, and restoring the quality of rivers and water bodies. By joining forces with us, you'll have the opportunity to make a tangible difference in regions like Indonesia, where water scarcity and contamination pose significant challenges. Together, we can empower communities, transform lives, and ensure a healthier, more sustainable future for all.",
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
                  "1. Empower Communities Through Action",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "2. Combat Pollution, Restore Vital Resources",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Text(
                  "3. Raise Awareness, Drive Change",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 100),
                child: const Text(
                  "4. Champion Sustainable Solutions",
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

