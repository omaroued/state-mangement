import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/core/product.dart';
import 'package:provider_app/models/cart_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CartModel>(context);

    return ListTile(
      title: Text(product.title),
      trailing: IconButton(
          onPressed: () {
            if (model.isAddedToCart(product)) {
              model.removeFromCart(product);
            } else {
              model.addToCart(product);
            }
          },
          icon: Icon(model.isAddedToCart(product)
              ? Icons.done
              : Icons.shopping_cart_outlined)),
    );
  }
}
