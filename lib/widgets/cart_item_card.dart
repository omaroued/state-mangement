import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/core/cart_item.dart';
import 'package:provider_app/models/cart_model.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  const CartItemCard({Key? key,required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final model=Provider.of<CartModel>(context);

    return Row(
      children: [
        Expanded(child: Text(
          cartItem.product.title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        )),

        IconButton(onPressed: (){
          model.incrementQuantity(cartItem);
        }, icon:const Icon(Icons.add)),

        Text(cartItem.quantity.toString()),

        IconButton(onPressed: (){
          model.decrementQuantity(cartItem);
        }, icon:const Icon(Icons.remove)),



        IconButton(onPressed: (){
          model.removeFromCart(cartItem.product);
        }, icon: const Icon(Icons.clear))
      ],



    );
  }
}
