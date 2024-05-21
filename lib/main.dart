import 'package:education_app/pages/climatechange.dart';
import 'package:education_app/pages/history.dart';
import 'package:education_app/pages/course_screen.dart';
import 'package:education_app/pages/deforestation.dart';
import 'package:education_app/pages/details_screen.dart';
import 'package:education_app/pages/donate.dart';
import 'package:education_app/pages/flood.dart';
import 'package:education_app/pages/foodwaste.dart';
import 'package:education_app/pages/profile.dart';
import 'package:education_app/pages/sign-in.dart';
import 'package:education_app/pages/sign-up.dart';
import 'package:education_app/pages/homepage.dart';
import 'package:education_app/pages/splashscreen.dart';
import 'package:education_app/pages/takeAction1.dart';
import 'package:education_app/pages/waste.dart';
import 'package:education_app/providers/volunteers.dart';
import 'package:education_app/providers/volunteers_display.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoAction App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      routes: {
        "/splash": (context) => SplashScreen(),
        "/signin": (context) => SignInPage(),
        "/signup": (context) => SignUpPage(),
        "/home": (context) => HomePage(),
        "/history": (context) => HistoryPage(),
        "/course": (context) => CourseScreen(),
        "/deforestation": (context) => DeforestationPage(),
        "/climatechange": (context) => ClimateChangePage(),
        "/flood": (context) => FloodPage(),
        "/waste": (context) => WastePage(),
        "/foodwaste": (context) => FoodWastePage(),
        "/details": (context) => DetailsScreen(title: "More ways you can help"),
        "/profile": (context) => ProfilePage(),
        "/donate": (context) => DonatePage(),
        "/take1": (context) => TakeAction1Page(title: ''),
      },
      initialRoute: "/splash",
    );
  }
}
