import 'package:education_app/models/vol_article.dart';
import 'package:education_app/pages/detail_vol_articles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:education_app/models/edu_article.dart';
import 'package:education_app/pages/add_edu_article.dart';
import 'package:education_app/pages/add_vol_article.dart';
import 'package:education_app/pages/add_don_article.dart';
import 'package:education_app/pages/detail_article.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Artikel> articles = [];
  List<ArtikelVolunteer> volunteerArticles = [];
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    fetchArticles();
    fetchVolunteerArticles();
    checkAdminStatus();
  }

  Future<void> fetchArticles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('articles').get();
    setState(() {
      articles =
          snapshot.docs.map((doc) => Artikel.fromFirestore(doc)).toList();
    });
  }

  Future<void> fetchVolunteerArticles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('vol_articles').get();
    setState(() {
      volunteerArticles = snapshot.docs
          .map((doc) => ArtikelVolunteer(
                nameArticle: doc['nameArticle'],
                image: doc['image'],
                description: doc['description'],
              ))
          .toList();
    });
  }

  Future<void> checkAdminStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.email)
          .get();
      if (userDoc.exists) {
        setState(() {
          isAdmin = userDoc.data()?['isAdmin'] ?? false;
        });
      }
    }
  }

  void _showArticleTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(10, 99, 61, 50),
              ),
              child: const Text(
                'Pilih Jenis Artikel',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(251, 241, 221, 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Artikel Edukasi'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEducationArticlePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Artikel Volunteer'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddVolunteerArticlePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Artikel Donasi'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDonationArticlePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(251, 241, 221, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text('Batal',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 170,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(10, 99, 61, 50),
                Color.fromRGBO(78, 138, 103, 50),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 18, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 130),
                          child: const Text(
                            "EcoAction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getGreeting(),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                            future: getUserDetails(),
                            builder: (context, snapshot) => Text(
                              snapshot.data?.data()?['username'] ?? '',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: getUserDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/default_avatar.png'),
                            );
                          }
                          final userPhotoUrl =
                              snapshot.data?.data()?['photoUrl'] ??
                                  'assets/default_avatar.png';
                          return CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(userPhotoUrl),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
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
                height: 200,
                child: articles.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Color.fromRGBO(10, 99, 61, 50)))
                    : CarouselSlider.builder(
                        itemCount: articles.length,
                        itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) =>
                            GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailArticlePage(article: articles[index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 241, 221, 1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  spreadRadius: 0.05,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  articles[index].image,
                                  width: 150,
                                  height: 90,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    print('Error loading image: $error');
                                    return const Placeholder(
                                      fallbackHeight: 90,
                                      fallbackWidth: 150,
                                    );
                                  },
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  articles[index].nameArticle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.4,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
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
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Color.fromRGBO(10, 99, 61, 50),
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: volunteerArticles.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Color.fromRGBO(10, 99, 61, 50)))
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: volunteerArticles.length,
                        itemBuilder: (BuildContext context, int index) {
                          final article = volunteerArticles[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VolunteerArticleDetailPage(
                                    title: article.nameArticle,
                                    image: article.image,
                                    description: article.description,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 241, 221, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    spreadRadius: 0.05,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      article.image,
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          height: 120,
                                          color: Colors.grey,
                                          child: const Center(
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      article.nameArticle,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              backgroundColor: Color.fromRGBO(78, 138, 103, 50),
              splashColor: Color.fromRGBO(78, 138, 103, 50),
              onPressed: () {
                _showArticleTypeDialog(context);
              },
              child: Icon(Icons.edit, color: Colors.white),
            )
          : null,
    );
  }
}
