import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfood/src/screens/products.dart';

class Routes {
  static const products = 'products';
  static const login = 'login';

  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.products:
        return MaterialPageRoute(
          builder: (context) => ProductsScreen(),
        );

        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Page not found with the name ${settings.name}'),
            ),
          ),
        );
    }
  }
}
