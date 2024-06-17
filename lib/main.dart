import 'package:education_app/firebase_options.dart';
import 'package:education_app/pages/add_don_article.dart';
import 'package:education_app/pages/add_vol_article.dart';
import 'package:education_app/pages/climatechange.dart';
import 'package:education_app/pages/deforestation.dart';
import 'package:education_app/pages/flood.dart';
import 'package:education_app/pages/foodwaste.dart';
import 'package:education_app/pages/history.dart';
import 'package:education_app/pages/homepage.dart';
import 'package:education_app/pages/sign-in.dart';
import 'package:education_app/pages/sign-up.dart';
import 'package:education_app/pages/splashscreen.dart';
import 'package:education_app/pages/waste.dart';
import 'package:education_app/providers/don_articles.dart';
import 'package:education_app/providers/donations.dart';
import 'package:education_app/providers/edu_articles.dart';
import 'package:education_app/providers/vol_articles.dart';
import 'package:education_app/providers/volunteers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Articles()),
        ChangeNotifierProvider(
          create: (context) => VolunteerArticles(),
          child: AddVolunteerArticlePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => DonationArticles(),
          child: AddDonationArticlePage(),
        ),
        ChangeNotifierProvider(create: (_) => Volunteers()),
        ChangeNotifierProvider(create: (_) => Donations()),
      ],
      child: MaterialApp(
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
          "/deforestation": (context) => DeforestationPage(),
          "/climatechange": (context) => ClimateChangePage(),
          "/flood": (context) => FloodPage(),
          "/waste": (context) => WastePage(),
          "/foodwaste": (context) => FoodWastePage(),
          // "/profile": (context) => ProfilePage(),
          // "/donate": (context) => DonationPage(),
        },
        initialRoute: "/splash",
      ),
    );
  }
}
