import 'package:flutter/material.dart';
import 'package:kfood/src/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: (MediaQuery.of(context).size.width - 10) / 2,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text("NRs ${product.newPrice}", maxLines: 1),
                        ),
                        Expanded(
                          child: Text("NRs ${product.oldPrice}", maxLines: 1),
                        ),
                      ],
                    ),
                    Text(
                      product.name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text("Offer!"),
            ),
          ),
        ],
      ),
    );
  }
}
