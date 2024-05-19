import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/constants/color.dart';
import 'package:education_app/widgets/lesson_card.dart';
import 'package:education_app/models/lesson.dart';

class DetailsScreen extends StatefulWidget {
  final String title;

  const DetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTag = 0; 

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          "Engaging Volunteers in the Fight Against Deforestation: Opportunities and Impact",
                          textAlign: TextAlign.center, 
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 17),
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
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(child: Image.asset("images/deforestation.jpg")),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  "What can we do?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 25),
                  child: Text(
                      " Welcome to our page addressing the issue of deforestation in Indonesia! We invite you to join our volunteer movement focused on forest and environmental conservation. Deforestation, referring to the extensive reduction of forests, has become a serious issue in Indonesia, impacting biodiversity loss, disrupting ecosystems, and contributing to climate change.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14)),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 18, left: 4, right: 25),
                  child: Text("Why Join as a Volunteer   ?",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 18, left: 10, right: 25),
                  child: Text(
                      "1. Forest Conservation Mission",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 18, left: 10, right: 25),
                  child: Text(
                      "2. Combatting Deforestation",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 18, left: 10, right: 25),
                  child: Text(
                      "3. Addressing Palm Oil Impact",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 18, left: 10, right: 25),
                  child: Text(
                      "4. Fighting Illegal Logging",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
              onTap: () {},
              color: Color.fromARGB(255, 27, 94, 32),
              height: 45,
              width: 45,
              child: const Text(
                "Take Action",
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
