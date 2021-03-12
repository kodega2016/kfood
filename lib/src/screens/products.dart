import 'package:flutter/material.dart';
import 'package:kfood/src/models/product.dart';
import 'package:kfood/src/widgets/products/product_tile.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _isGridView = false;

  void _toggleViewMode() => setState(() => _isGridView = !_isGridView);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Filter"),
                        Text("Price"),
                        RangeSlider(
                          labels: RangeLabels("Start", "End"),
                          max: 10000,
                          min: 0,
                          values: RangeValues(0, 10000),
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (val) {},
                        ),
                        SwitchListTile(
                          title: Text('Offers'),
                          value: true,
                          onChanged: (val) {},
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(_isGridView ? Icons.web_outlined : Icons.dns_outlined),
            onPressed: _toggleViewMode,
          ),
        ],
      ),
      body: _isGridView
          ? GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (context, i) {
                final _product = products[i];
                return ProductTile(product: _product);
              },
            )
          : ListView.separated(
              padding: EdgeInsets.all(10),
              separatorBuilder: (context, i) => const SizedBox(height: 8),
              itemCount: products.length,
              itemBuilder: (context, i) {
                final _product = products[i];
                return Container(
                  padding: const EdgeInsets.all(10),
                  height: 110,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            _product.image,
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_product.name),
                                Text("Nrs ${_product.newPrice}"),
                              ],
                            ),
                          ),
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
