import 'package:dhir_app/model/data_brain.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<DataBrain> cartItems = [
    DataBrain("assets/images/favorite2.png", "Song of india", 4),
    DataBrain("assets/images/favorite4.png", "Banana plant", 5),
    DataBrain("assets/images/favorite5.png", "Devil's Ivy", 9),
  ];

  int price = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MaterialButton(
        onPressed: () async {
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
          "HADDA IIBSO",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
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
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              margin: EdgeInsets.all(12),
              height: 100,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          cartItems[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItems[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${cartItems[1].price * price}",
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
                                if (price > 1) {
                                  price--;
                                }
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border:
                                    Border.all(color: Colors.black, width: 1.2),
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
                            "$price",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                price++;
                              });
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border:
                                    Border.all(color: Colors.black, width: 1.2),
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
                ],
              ),
            );
          }),
    );
  }
}
