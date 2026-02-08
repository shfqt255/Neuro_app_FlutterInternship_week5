import 'package:flutter/material.dart';
import 'package:shopping_cart_app/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void AddToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void RemoveFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  int get itemCount => _cart.length;

  double get totalPrice {
    return _cart.fold(0.0, (sum, item) => sum + item.price);
  }
}
