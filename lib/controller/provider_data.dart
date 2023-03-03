import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/model/data_brain.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  List<DataBrain> getCartItems = [
    // DataBrain("assets/images/favorite1.png", "Spider Plant", 3),
    // DataBrain("assets/images/favorite2.png", "Song of india", 4),
  ];

  int amount = 1;

  void addToCart(String imageUrl, String name, int price) {
    getCartItems.add(DataBrain(imageUrl, name, price));

    notifyListeners();
  }

  removeItem(String imageUrl, String name, int price) {
    getCartItems.remove(DataBrain(imageUrl, name, price));
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
