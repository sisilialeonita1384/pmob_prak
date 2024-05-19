import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/category.dart';
import 'package:education_app/pages/climatechange.dart';
import 'package:education_app/pages/deforestation.dart';
import 'package:education_app/pages/flood.dart';
import 'package:education_app/pages/foodwaste.dart';
import 'package:education_app/pages/takeAction1.dart';
import 'package:education_app/pages/takeAction2.dart';
import 'package:education_app/pages/takeAction3.dart';
import 'package:education_app/pages/takeAction4.dart';
import 'package:education_app/pages/takeAction5.dart';
import 'package:education_app/pages/textilewaste.dart';
import 'package:education_app/pages/waste.dart';
import 'package:education_app/pages/formvolunteer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  List<String> imgList = [
    "deforestation.jpg",
    "climatechange.png",
    "waste.png",
    "flood.jpg",
    "foodwaste.jpg",
    "textilewaste.jpg",
  ];
  List<Widget> newsPage = [
    DeforestationPage(),
    ClimateChangePage(),
    WastePage(),
    FloodPage(),
    FoodWastePage(),
    TextileWastePage(),
  ];
  List<String> textList = [
    "Deforestation",
    "Climate Change",
    "Waste Accumulation",
    "Flood",
    "Food Waste",
    "TextileWaste",
  ];
  List<Widget> gridPage = [
    TakeAction1Page(
      title: '',
    ),
    TakeAction2Page(
      title: '',
    ),
    TakeAction3Page(
      title: '',
    ),
    TakeAction4Page(
      title: '',
    ),
    TakeAction5Page(
      title: '',
    ),
  ];
  List<Category> categoryList = [
    Category(
      name: 'Deforestation',
      noOfVolunteers: 55,
      thumbnail: 'images/deforestation_action.jpg',
    ),
    Category(
      name: 'Flood',
      noOfVolunteers: 20,
      thumbnail: 'images/flood_action.jpg',
    ),
    Category(
      name: 'Clean Water Crisis',
      noOfVolunteers: 16,
      thumbnail: 'images/watercrisis_action.jpg',
    ),
    Category(
      name: 'Waste Accumulation',
      noOfVolunteers: 25,
      thumbnail: 'images/waste_action.jpg',
    ),
    Category(
      name: 'Preserving marine',
      noOfVolunteers: 25,
      thumbnail: 'images/marine_action.jpg',
    ),
  ];

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  int _currentIndexDetails = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(10, 99, 61, 50),
                Color.fromRGBO(78, 138, 103, 50),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 180),
                      child: const Text(
                        "EcoAction",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Good Morning,",
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                        FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          future: getUserDetails(),
                          builder: (context, snapshot) => Text(
                              snapshot.data?.data()?['username'] ?? '',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/evita.png'),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 30, left: 15),
              child: const Text(
                "What's New?",
                style: TextStyle(
                  color: Color.fromRGBO(10, 99, 61, 50),
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 150,
              child: CarouselSlider.builder(
                itemCount: newsPage.length,
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      if (index >= 0 && index < newsPage.length) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => newsPage[index],
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: (1)),
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 241, 221, 50),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4.0,
                            spreadRadius: 0.05,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/${imgList[index]}",
                            width: 150,
                            height: 90,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "${textList[index]}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.4,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More Ways You Can Help",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color.fromRGBO(10, 99, 61, 50),
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color.fromRGBO(10, 99, 61, 50),
                          ),
                    ),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  details: gridPage[index],
                  category: categoryList[index],
                );
              },
              itemCount: categoryList.length,
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final Widget details;

  const CategoryCard({
    Key? key,
    required this.details,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => this.details,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(251, 241, 221, 50),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfVolunteers.toString()} have joined",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
