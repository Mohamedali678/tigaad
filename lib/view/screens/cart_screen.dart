import 'package:dhir_app/controller/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int incrementPrice = 1;
  int decrementPrice = 1;

  double totalPrice = 0;

  double money = 0;

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
          "${totalPrice + money}  HADDA IIBSO",
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
          itemCount: Provider.of<ProviderData>(context).getCartItems.length,
          itemBuilder: (context, index) {
            final data = Provider.of<ProviderData>(context).getCartItems;
            money =
                Provider.of<ProviderData>(context).getCartItems[index].price;

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
                        image: AssetImage(
                          data[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data[index].price * decrementPrice}",
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
                                if (decrementPrice > 1) {
                                  decrementPrice--;
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
                            "$incrementPrice",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                incrementPrice++;
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<ProviderData>(context, listen: false)
                            .removeItem(data[index].imageUrl, data[index].name,
                                data[index].price);
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
          }),
    );
  }
}
