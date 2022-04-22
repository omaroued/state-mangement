import 'package:provider_app/core/product.dart';

class CartItem{
  int quantity;
  final Product product;

  CartItem({required this.quantity,required this.product});
}