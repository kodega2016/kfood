import 'package:flutter/material.dart';
import 'package:kfood/src/models/product.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(height: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        itemCount: carts.length,
        itemBuilder: (context, i) {
          final _cart = carts[i];
          return Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300])),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(_cart.product.image, width: 80, height: 80),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_cart.product.name),
                          Text("Nrs ${_cart.product.newPrice}"),
                        ],
                      ),
                      Spacer(),
                      Text("x ${_cart.qty}"),
                    ],
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
