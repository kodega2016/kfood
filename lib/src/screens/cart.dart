import 'package:flutter/material.dart';
import 'package:kfood/src/models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0.4, 0.5),
            ),
          ],
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total:"),
                Text("12000"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Charge:"),
                Text("120"),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:"),
                Text("14000"),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text("Checkout"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => const SizedBox(height: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        itemCount: carts.length,
        itemBuilder: (context, i) {
          final _cart = carts[i];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(_cart.product.image, width: 80, height: 80),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _cart.product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("Nrs ${_cart.product.newPrice}"),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text("x ${_cart.qty}"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
