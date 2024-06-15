import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/don_article.dart';
import 'package:education_app/pages/donate1.dart';
import 'package:education_app/pages/donate2.dart';
import 'package:education_app/pages/donate3.dart';
import 'package:education_app/pages/donate4.dart';
import 'package:education_app/pages/donate5.dart';
import 'package:education_app/pages/donate6.dart';
import 'package:education_app/pages/donate7.dart';
import 'package:education_app/pages/donate8.dart';
import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
    List<Widget> donateForm = [
    donatePage1(title: ''),
    donatePage2(title: ''),
    donatePage3(title:''),
    donatePage4(title:''),
    donatePage5(title:''),
    donatePage6(title:''),
    donatePage7(title:''),
    donatePage8(title:''),
  ];
  List<ArtikelDonasi> donationArticles = [];
  @override
  void initState() {
    super.initState();
    getDonationArticles();
  }
  Future<void> getDonationArticles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('vol_articles').get();
    setState(() {
      donationArticles = snapshot.docs
          .map((doc) => ArtikelDonasi(
                nameArticle: doc['nameArticle'],
                image: doc['image'],
                description: doc['description'],
                
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donate Now',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
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
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _articles[index];
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 0.1, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(251, 241, 221, 50),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.only(left: 15, right: 20, bottom: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.postedOn,
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          ElevatedButton(
                            onPressed: () {
                              if(index < donateForm.length){
                                Navigator.push(context,
                              MaterialPageRoute(builder: (context) => donateForm[index]));
                              }  
                            },
                            child: const Text(
                              "Donate Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            style: const ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(Size(130, 0)),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(78, 138, 103, 50)),
                              overlayColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(78, 138, 103, 50)),
                            ),
                          )
                        ])
                      ],
                    )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/${item.image}"),
                            ))),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String subtitle;
  final String image;
  final String postedOn;

  Article(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.postedOn});
}

final List<Article> _articles = [
  Article(
    title:
        "Planting Hope, Preserving Nature: Donate Rp10,000 to Plant 1 Tree and Change the Future of the Environment!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "deforestation.jpg",
    postedOn: "Yesterday",
  ),
  Article(
      title: "Transforming Tomorrow: Join the Fight Against Climate Change!",
      subtitle: 'The feature, which introduced in April as part of Instagram',
      image: "climatechange.png",
      postedOn: "4 hours ago"),
  Article(
    title: "Together, We Can Overcome: Aid Flood Victims Today!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "flood_action.jpg",
    postedOn: "2 days ago",
  ),
  Article(
    title: "End Food Waste, Feed Hope: Donate to Sustainable Food Solutions!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "foodwaste.jpg",
    postedOn: "22 hours ago",
  ),
  Article(
    title: "Water for All: Be a Lifesaver in the Global Water Crisis!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "watercrisis_action.jpg",
    postedOn: "2 hours ago",
  ),
  Article(
    title: "Guardians of the Sea: Protecting Our Marine Environment Together!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "marine.jpg",
    postedOn: "10 days ago",
  ),
  Article(
    title: "Break the Plastic Curse: Donate to Save Our Planet!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "waste.png",
    postedOn: "10 hours ago",
  ),
  Article(
    title:
        "Fashioning a Greener Future: Support Textile Recycling Initiatives!",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    image: "textilewaste.jpg",
    postedOn: "10 hours ago",
  ),
];
