import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _cart = [];

  List<ProductModel> get cartList => _cart;

  void toggleCart(ProductModel product) {
    if (_cart.contains(product)) {
      _cart.remove(product);
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _cart.remove(product);
    notifyListeners();
  }
  bool isCart(ProductModel product) {
    return _cart.contains(product);
  }
    double get totalPrice {
    return _cart.fold(0, (sum, item) => sum + item.price);
  }
}
