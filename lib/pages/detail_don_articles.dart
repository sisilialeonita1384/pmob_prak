import 'package:education_app/widgets/enroll_bottom_sheet_donate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 45, bottom: 30),
                      child: Text(
                        artikel.nameArticle,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 17),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Image.network(artikel.image),
              ),
              
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                  artikel.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
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
