import 'package:dhir_app/controller/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_data.dart';

class CartItem extends StatefulWidget {
  //const CartItem({super.key});

  final String imageUrl;
  final String name;
  final int price;
  int quantity;
  int index;

  CartItem(this.imageUrl, this.name, this.price, this.quantity, this.index);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(12),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color(0xffF6F6F6),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.imageUrl),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${widget.price * counter}",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 45, 102, 47),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (counter > 1) {
                          counter--;
                          Provider.of<CartProvider>(context, listen: false)
                              .decrementItem(Provider.of<CartProvider>(context,
                                      listen: false)
                                  .getAllCarts[widget.index]);
                        }
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.black, width: 1.2),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${counter}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        counter++;
                        Provider.of<CartProvider>(context, listen: false)
                            .incrementItem(Provider.of<CartProvider>(context,
                                    listen: false)
                                .getAllCarts[widget.index]);
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.black, width: 1.2),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                setState(() {});
                Provider.of<CartProvider>(context, listen: false);
              },
              icon: Icon(
                Icons.close,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
