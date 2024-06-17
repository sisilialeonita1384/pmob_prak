import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:education_app/models/don_article.dart';

class DonationArticleDetailPage extends StatelessWidget {
  final ArtikelDonasi artikel;

  const DonationArticleDetailPage({
    Key? key,
    required this.artikel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 80,
              backgroundColor: Color.fromRGBO(78, 138, 103, 50),
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white,),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          artikel.nameArticle,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Image.network(artikel.image),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    artikel.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 80), // Space to accommodate BottomSheet at the bottom
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return SizedBox(
              height: 80,
              child: EnrollBottomSheetDonate(
                title: artikel.nameArticle,
                imageUrl: artikel.image,
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DonationArticleDetailPage(
      artikel: ArtikelDonasi(
        nameArticle: '',
        image: '',
        description: '',
      ),
    ),
  ));
}
