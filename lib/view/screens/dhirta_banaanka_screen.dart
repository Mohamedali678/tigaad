import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/view/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_provider.dart';
import '../../controller/provider_data.dart';
import '../../model/models.dart';

class DhirtaBanaankaScreen extends StatelessWidget {
  //const DhirtaBanaankaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Dhirta Banaanka",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffF6F6F6),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "(${Provider.of<CartProvider>(context).getAllCarts.length})",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              size: 40,
              color: Color.fromARGB(255, 44, 91, 46),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Plants').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            List<plantModel> outsidePlants = [];

            if (snapshot.data != null) {
              // Add a null check here
              snapshot.data!.docs.forEach((doc) {
                if (doc.data()['type'] == 'outside') {
                  outsidePlants.add(plantModel(
                    doc.data()['imageUrl'],
                    doc.data()['name'],
                    doc.data()['price'],
                    doc.data()['type'],
                  ));
                }
              });
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 470,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Kuwa Loogu Jecel Yahay",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 51, 107, 53),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: outsidePlants.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                        ),
                        padding: EdgeInsets.only(bottom: 60),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 4)),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            margin: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          outsidePlants[index].imageUrl)),
                                ),
                                Text(
                                  outsidePlants[index].name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${outsidePlants[index].price.toString()}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 102, 47),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .addToCart(
                                            outsidePlants[index],
                                          );
                                        },
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          size: 40,
                                          color:
                                              Color.fromARGB(255, 37, 76, 38),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
