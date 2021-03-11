import 'package:flutter/material.dart';
import 'package:kfood/src/models/category.dart';
import 'package:kfood/src/models/product.dart';
import 'package:kfood/src/widgets/category/category_list_tile.dart';
import 'package:kfood/src/widgets/products/product_banner_item.dart';
import 'package:kfood/src/widgets/products/products_with_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('Sign In'),
                leading: Icon(Icons.lock_open_outlined),
              ),
              ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Food Cart'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey[500],
                      offset: Offset(0.2, 0.4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: 'Search Food & Restaurants',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.filter_list_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Categories".toUpperCase(),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 120,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    final _category = categories[i];
                    return CategoryTile(category: _category);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: ProductBannerItem(
                        image:
                            'https://hamrogrocery.com/uploads/Artboard%201%20copy0.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProductBannerItem(
                        image:
                            'https://hamrogrocery.com/uploads/Artboard%2010_1590037232.png',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ProductWithTitle(
                title: 'Deal of the month',
                products: products
                  ..shuffle()
                  ..take(2).toList(),
              ),
              const SizedBox(height: 10),
              ProductWithTitle(
                title: 'Special Offers',
                products: products.take(2).toList()..shuffle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
