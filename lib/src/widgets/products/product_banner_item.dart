import 'package:flutter/material.dart';

class ProductBannerItem extends StatelessWidget {
  final String image;

  const ProductBannerItem({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        image,
        height: 100,
        fit: BoxFit.fill,
      ),
    );
  }
}
