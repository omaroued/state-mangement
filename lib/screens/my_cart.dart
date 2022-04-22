import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/core/cart_item.dart';
import 'package:provider_app/core/product.dart';
import 'package:provider_app/models/cart_model.dart';
import 'package:provider_app/widgets/cart_item_card.dart';

class MyCart extends StatelessWidget {
  static void create(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  MyCart._()));
  }

  MyCart._({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My cart"),
        centerTitle: true,
      ),
      body: Consumer<CartModel>(
        builder: (context,model,_){

          print("Consumer rebuild");


          return ListView.separated(
              padding: EdgeInsets.all(20),
              itemBuilder: (context,position){


                return CartItemCard(cartItem: model.items[position]);
              },
              separatorBuilder: (context,position){
                return const Divider();
              },
              itemCount: model.items.length);

        },

      ),
    );
  }
}
