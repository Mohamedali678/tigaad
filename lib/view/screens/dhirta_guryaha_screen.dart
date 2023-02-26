import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/view/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_data.dart';

class DhirtaGuryahaScreen extends StatelessWidget {
  // const DhirtaGuryahaScreen({super.key});

  final object = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "Dhirta Guryaha",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffF6F6F6),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "(${Provider.of<ProviderData>(context).getCartItems.length})",
              style: TextStyle(color: Colors.black, fontSize: 22),
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
      body: GridView.builder(
        itemCount: object.getAllData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.only(top: 30),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(3, 4),
                ),
              ],
              color: Color(0xffF6F6F6),
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
                    image: AssetImage(
                      object.getAllData[index].imageUrl,
                    ),
                  ),
                ),
                Text(
                  object.getAllData[index].name,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${object.getAllData[index].price.toString()}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 45, 102, 47),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<ProviderData>(context, listen: false)
                            .addToCart(
                                object.getAllData[index].imageUrl,
                                object.getAllData[index].name,
                                object.getAllData[index].price);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Color.fromARGB(255, 37, 76, 38),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
