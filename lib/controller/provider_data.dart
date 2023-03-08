import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/model/data_brain.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  List<DataBrain> getCartItems = [];

  int amount = 1;

  void addToCart(
    String imageUrl,
    String name,
    int price,
    String type,
  ) {
    getCartItems.add(DataBrain(imageUrl, name, price, type));

    notifyListeners();
  }

  removeItem(String imageUrl, String name, String type, int price) {
    getCartItems.remove(DataBrain(imageUrl, name, price, type));
  }

  void updateList(int index) {
    getCartItems.removeAt(index);
    notifyListeners();
  }

  void incrementItem() {
    amount++;
    notifyListeners();
  }

  void decrementItem() {
    if (amount > 1) {
      amount--;
    }

    notifyListeners();
  }

  //getting total price in cart screen.
  getTotalPrice() {
    int cartPrice = 0;
    getCartItems.forEach((element) {
      cartPrice += element.price * amount;
    });
    return cartPrice;
  }
}
