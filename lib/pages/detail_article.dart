import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:education_app/providers/edu_articles.dart';
import '../models/edu_article.dart'; // Sesuaikan dengan path model Artikel

class DetailArticlePage extends StatefulWidget {
  final Artikel article;

  const DetailArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  _DetailArticlePageState createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  late Future<Uint8List> _imageFuture;
  final Articles articles = Articles(); // Inisialisasi provider Artikel

  @override
  void initState() {
    super.initState();
    _imageFuture = _fetchImage(widget.article.image);
  }

  Future<Uint8List> _fetchImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      throw Exception('Failed to load image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Uint8List>(
              future: _imageFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('Error loading image: ${snapshot.error}');
                  return Center(child: Icon(Icons.error, color: Colors.red));
                } else if (snapshot.hasData) {
                  return Image.memory(snapshot.data!, fit: BoxFit.cover);
                } else {
                  return Center(child: Icon(Icons.broken_image, color: Colors.grey));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.article.nameArticle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.article.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
