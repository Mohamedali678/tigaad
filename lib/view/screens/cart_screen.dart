import 'package:dhir_app/controller/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          itemCount: Provider.of<ProviderData>(context).getCartItems.length,
          itemBuilder: (context, index) {
            final data = Provider.of<ProviderData>(context).getCartItems;
            data[index].price;
            // totalPrice += price!;
            int length = Provider.of<ProviderData>(context).getCartItems.length;
            int amountLength = Provider.of<ProviderData>(context).amount.length;

            if (amountLength < length) {
              Provider.of<ProviderData>(context).incrementAmount();
            }

            // Provider.of<ProviderData>(context).amount = List.filled(length, 1);

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
                        image: NetworkImage(
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
                        "${data[index].price * Provider.of<ProviderData>(context).amount[1]}",
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
                              Provider.of<ProviderData>(context, listen: false)
                                  .decrementItem(index);
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
                            "${Provider.of<ProviderData>(context).amount}",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Provider.of<ProviderData>(context, listen: false)
                                  .incrementItem(index);
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
                            .updateList(index);
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
      bottomSheet: MaterialButton(
        onPressed: () async {
          // final Uri url = Uri(
          //   scheme: "tel",
          //   path:
          //       "*712*618907483*${Provider.of<ProviderData>(context, listen: false).getTotalPrice(index)} #",
          // );
          // if (await canLaunchUrl(url)) {
          //   await launchUrl(url);
          // } else {
          //   print("Cannot launch");
          // }
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
          "sasasa",
          // "\$${Provider.of<ProviderData>(context).getTotalPrice()}  HADDA IIBSO",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
