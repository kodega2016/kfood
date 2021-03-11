import 'package:meta/meta.dart';

class Product {
  final String id;
  final String name;
  final String image;
  final double newPrice;
  final double oldPrice;
  final bool hasOffer;

  Product({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.newPrice,
    @required this.oldPrice,
    @required this.hasOffer,
  });
}

var products = <Product>[
  Product(
    id: '1',
    name: 'Mamy Poko Paint XS 9\'s',
    image:
        'https://hamrogrocery.com/uploads/products/thumbnail/5ebe2494a683d.jpg',
    newPrice: 145,
    oldPrice: 159,
    hasOffer: true,
  ),
  Product(
    id: '1',
    name: 'HILIFE 800GM WHITE OATS (POUCH)',
    image:
        'https://hamrogrocery.com/uploads/products/thumbnail/5ec15e27f13b7.jpg',
    newPrice: 250,
    oldPrice: 275,
    hasOffer: true,
  ),
  Product(
    id: '1',
    name:
        'WAI WAI 100GM JUMBO INSTANT CHICKEN FLAVOURED NOODLES (30 PACKETS BOX)',
    image:
        'https://hamrogrocery.com/uploads/products/thumbnail/5f55be4e20f8c.jpg',
    newPrice: 720,
    oldPrice: 750,
    hasOffer: true,
  ),
  Product(
    id: '1',
    name: 'Sor Sunflower Oil 1.8 ltr',
    image:
        'https://hamrogrocery.com/uploads/products/thumbnail/5eba9c8c31733.jpg',
    newPrice: 549,
    oldPrice: 600,
    hasOffer: true,
  ),
  Product(
    id: '1',
    name: 'VCS Sausage Chilly Chicken',
    image:
        'https://hamrogrocery.com/uploads/products/thumbnail/5ebbdc23e5d25.jpg',
    newPrice: 374,
    oldPrice: 415,
    hasOffer: true,
  ),
];
