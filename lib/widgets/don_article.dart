import 'package:flutter/material.dart';

class DonationArticleItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String postedOn;

  DonationArticleItem(this.title, this.imageUrl, this.postedOn);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          postedOn,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
