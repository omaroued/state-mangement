import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/core/product.dart';
import 'package:provider_app/models/cart_model.dart';
import 'package:provider_app/screens/my_cart.dart';
import 'package:provider_app/screens/settings.dart';
import 'package:provider_app/widgets/product_card.dart';

class MyCatalog extends StatelessWidget {
  MyCatalog({Key? key}) : super(key: key);

  final List<Product> products = List.generate(
      50,
      (index) => Product(
          id: index, title: "Product " + index.toString(), price: index + 1));

  @override
  Widget build(BuildContext context) {
    final model=Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My catalog"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                MyCart.create(context);

              },
              icon: Badge(
                badgeContent:  Text(
                  model.items.length.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: const Icon(Icons.shopping_cart_outlined),
              )),
          IconButton(
              onPressed: () {
                Settings.create(context);
              },
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context,position){

            return ProductCard(product: products[position]);

          },
          separatorBuilder: (context,position){
            return const Divider();
          },
          itemCount: products.length),
    );
  }
}
