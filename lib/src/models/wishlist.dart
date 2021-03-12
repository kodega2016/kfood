import 'package:kfood/src/models/product.dart';
import 'package:meta/meta.dart';

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
