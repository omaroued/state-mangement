import 'package:flutter/material.dart';
import 'package:provider_app/core/cart_item.dart';
import 'package:provider_app/core/product.dart';

class CartModel extends ChangeNotifier {
  List<CartItem> items = [];

  void addToCart(Product product) {
    items.add(
        CartItem(quantity: 1, product: product)
    );
    notifyListeners();
  }

  void removeFromCart(Product product) {
    items.removeWhere((cartItem) => cartItem.product.id == product.id);
    notifyListeners();
  }

  bool isAddedToCart(Product product) {
    return items
        .where((cartItem) => cartItem.product.id == product.id)
        .isNotEmpty;
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      notifyListeners();
    }
  }
}
