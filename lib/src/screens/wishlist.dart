import 'package:flutter/material.dart';
import 'package:kfood/src/models/wishlist.dart';
import 'package:kfood/src/screens/login.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2));
        },
        child: ListView.separated(
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
                        Text(
                          _wishlist.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                    onPressed: () async {
                      final _isDelete = await KLoader.confirm(
                        context: context,
                        title: 'Are you sure to delete?',
                        content:
                            'The product will be removed from the wishlist.',
                      );
                      print(_isDelete);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
