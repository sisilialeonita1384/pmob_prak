import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:education_app/models/don_article.dart';
import 'package:education_app/pages/donate1.dart'; // Sesuaikan import dengan halaman donasi yang relevan

class DonationPage extends StatefulWidget {
  DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
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
          child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('don_articles').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Text('No donation articles found.');
              }

              final donationArticles = snapshot.data!.docs.map((doc) {
                String description = doc['description'];
                String subtitle = description.length > 50
                    ? '${description.substring(0, 50)}...'
                    : description;
                return ArtikelDonasi(
                  nameArticle: doc['nameArticle'],
                  image: doc['image'],
                  description: description,
                  subtitle: subtitle,
                );
              }).toList();

              return ListView.builder(
                itemCount: donationArticles.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = donationArticles[index];
                  return Container(
                    height: 136,
                    margin: const EdgeInsets.symmetric(horizontal: 0.1, vertical: 8.0),
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
                    padding: EdgeInsets.only(left: 15, right: 20, bottom: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.nameArticle,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item.subtitle,
                                style: TextStyle(fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Arahkan ke halaman donasi yang sesuai
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => donatePage1(title: item.nameArticle),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Donate Now",
                                      style: TextStyle(color: Colors.white, fontSize: 13),
                                    ),
                                    style: const ButtonStyle(
                                      fixedSize: MaterialStatePropertyAll(Size(130, 0)),
                                      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(78, 138, 103, 50)),
                                      overlayColor: MaterialStatePropertyAll(Color.fromRGBO(78, 138, 103, 50)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.image),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
