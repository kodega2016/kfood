import 'package:meta/meta.dart';

class Category {
  final String name;
  final String image;

  Category({@required this.name, @required this.image});
}

var categories = <Category>[
  Category(
    name: 'Health & Beauty',
    image: 'https://hamrogrocery.com/uploads/category/icon/5ec14c8feefe0.png',
  ),
  Category(
    name: 'Frozen',
    image: 'https://hamrogrocery.com/uploads/category/icon/5ec3a1981e66a.png',
  ),
  Category(
    name: 'Baby Care',
    image: 'https://hamrogrocery.com/uploads/category/icon/5ec14c5936113.png',
  ),
  Category(
    name: 'Packaged Foods & Snacks',
    image: 'https://hamrogrocery.com/uploads/category/icon/5ec3a1a8936f1.png',
  ),
  Category(
    name: 'Grocery',
    image: 'https://hamrogrocery.com/uploads/category/icon/5ec14e41d4df4.png',
  ),
  Category(
    name: 'Bakery & Diary',
    image: 'https://hamrogrocery.com/uploads/category/icon/5ec6010809be8.png',
  ),
];
