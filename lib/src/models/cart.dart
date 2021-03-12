import 'package:kfood/src/models/product.dart';
import 'package:meta/meta.dart';

class Cart {
  final String id;
  final Product product;
  final int qty;

  Cart({
    @required this.id,
    @required this.product,
    @required this.qty,
  });
}

var carts = <Cart>[
  Cart(
    id: '1',
    product: products[0],
    qty: 1,
  ),
  Cart(
    id: '2',
    product: products[2],
    qty: 2,
  ),
];
