import 'package:flutter/material.dart';
import 'package:solomons_pools_flutter/pictureCard.dart';

class PictureItem extends StatelessWidget {
  final String image1;
  final String image2;
  PictureItem({@required this.image1, @required this.image2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PictureCard(picture: this.image1),
          PictureCard(picture: this.image2),
        ],
      ),
    );
  }
}
