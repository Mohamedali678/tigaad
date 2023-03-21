import 'package:dhir_app/controller/provider_data.dart';
import 'package:dhir_app/view/screens/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: Provider.of<CartProvider>(context).getAllCarts.length,
          itemBuilder: (context, index) {
            final data = Provider.of<CartProvider>(context).getAllCarts;

            // totalPrice += price!;

            return CartItem(
              data[index].product.imageUrl,
              data[index].product.name,
              data[index].product.price,
            );
          }),
      bottomSheet: MaterialButton(
        onPressed: () async {
          final Uri url = Uri(
            scheme: "tel",
            path: "",
            // "*712*618907483*${Provider.of<CartProvider>(context, listen: false)} #",
          );

          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            print("Cannot launch");
          }

          // const url = "tel:+333333";
          // if (await canLaunch(url)) {
          //   await launch(url);
          // } else {
          //   throw 'Could not launch $url';
          // }
        },
        height: 60,
        minWidth: double.infinity,
        color: Colors.green,
        child: Text(
          "\$ HADDA IIBSO",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
