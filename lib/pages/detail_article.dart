import 'package:flutter/material.dart';
import 'package:education_app/models/edu_article.dart';

class DetailArticlePage extends StatelessWidget {
  final Artikel article;

  const DetailArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Article image URL: ${article.image}');  // Logging URL gambar

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: (article.image.isNotEmpty)  // Pengecekan URL gambar tidak kosong
                    ? Image.network(
                        article.image,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          print('Error loading image: $error');  // Logging kesalahan
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.red),
                                Text('Failed to load image'),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        article.nameArticle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: Text(
                        article.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    // Add other content or sections as needed
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
