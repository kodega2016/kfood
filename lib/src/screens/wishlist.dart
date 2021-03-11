import 'package:flutter/material.dart';
import 'package:kfood/src/models/product.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(height: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        itemCount: wishlists.length,
        itemBuilder: (context, i) {
          final _wishlist = wishlists[i];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.network(
                    _wishlist.product.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_wishlist.product.name),
                        Text("Nrs ${_wishlist.product.newPrice}"),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WishList {
  final String id;
  final Product product;

  WishList({@required this.id, @required this.product});
}

var wishlists = <WishList>[
  WishList(id: '1', product: products[0]),
  WishList(id: '2', product: products[1]),
  WishList(id: '3', product: products[2]),
  WishList(id: '4', product: products[3]),
];
