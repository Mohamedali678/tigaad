// import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/controller/cart_provider.dart';
import 'package:dhir_app/controller/provider_data.dart';
import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/view/screens/cart_screen.dart';
import 'package:dhir_app/view/screens/dhirta_banaanka_screen.dart';
import 'package:dhir_app/view/screens/dhirta_guryaha_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/models.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  List images = ["forest.jpg", "favorite1.png", "favorite2.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 241, 241),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 44, 91, 46),
        ),
        backgroundColor: Color(0xffF6F6F6),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "(${Provider.of<CartProvider>(context).getAllCarts.length})",
              style: TextStyle(color: Colors.black, fontSize: 26),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 180.0, autoPlay: true),
              //   items: images.map((image) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return Image.asset("assets/images/${image}");
              //       },
              //     );
              //   }).toList(),
              // ), // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //     color: Color(0xffD9D9D9),
              //   ),
              //   margin: EdgeInsets.all(12),
              //   height: 180,
              // ),
              ImageSlideshow(
                height: 190.0,
                initialPage: 0,
                children: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffD9D9D9),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/${image}")),
                        ),
                        margin: EdgeInsets.all(12),
                        height: 180,
                      );
                    },
                  );
                }).toList(),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "IIBSO HADDA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 51, 107, 53),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // TODO
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DhirtaGuryahaScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(2, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/home1.png"),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ToDO
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DhirtaBanaankaScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(2, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/home2.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // streambuiler
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Plants')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<plantModel> mostLikedPlants = [];
                    List<plantModel> insidePlants = [];
                    List<plantModel> outsidePlants = [];

                    if (snapshot.data != null) {
                      // Add a null check here
                      snapshot.data!.docs.forEach((doc) {
                        if (doc.data()['type'] == 'mostLiked') {
                          mostLikedPlants.add(plantModel(
                            doc.data()['imageUrl'],
                            doc.data()['name'],
                            doc.data()['price'],
                            doc.data()['type'],
                          ));
                        }
                      });
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 470,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                itemCount: mostLikedPlants.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  mostLikedPlants[index]
                                                      .imageUrl)),
                                        ),
                                        Text(
                                          mostLikedPlants[index].name,
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
                                              "\$${mostLikedPlants[index].price.toString()}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 45, 102, 47),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Provider.of<CartProvider>(
                                                          context,
                                                          listen: false)
                                                      .addToCart(
                                                    mostLikedPlants[index],
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.shopping_cart,
                                                  size: 40,
                                                  color: Color.fromARGB(
                                                      255, 37, 76, 38),
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
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tigaad",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () async {
                final Uri url = Uri(
                  scheme: "tel",
                  path: "+252618907483",
                );

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print("Cannot launch");
                }
              },
              leading: Icon(
                Icons.call,
                size: 30,
              ),
              title: Text(
                "Call us",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            )
          ],
        ),
      ),
    );
  }
}
