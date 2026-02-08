import 'package:flutter/material.dart';
import 'package:shopping_cart_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _product = [
    Product(name: 'Laptop', id: 'Dell24', price: 50000),
    Product(name: 'Microphone', id: 'vivo25', price: 5000),
    Product(name: 'Charger', id: 'DellCharger12', price: 2000),
    Product(name: 'Bag', id: 'bag34', price: 2500),
  ];

  List<Product> get product => _product;
}
