import 'package:flutter/material.dart';
import 'package:kfood/src/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: (MediaQuery.of(context).size.width - 20) / 3,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            category.name.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
