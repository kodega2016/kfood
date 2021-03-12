import 'package:flutter/material.dart';
import 'package:kfood/src/models/product.dart';
import 'package:kfood/src/routes.dart';
import 'product_tile.dart';

class ProductWithTitle extends StatelessWidget {
  final String title;
  final List<Product> products;

  const ProductWithTitle({
    Key key,
    @required this.title,
    @required this.products,
  })  : assert(title != null, 'Title should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.products),
                child: Text(
                  "View All",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 140,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                final _product = products[i];
                return ProductTile(product: _product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
