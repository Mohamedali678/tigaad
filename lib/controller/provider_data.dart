import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/model/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  List<plantModel> getCartItems = [];

  int amount = 1;

  void addToCart(
    String imageUrl,
    String name,
    int price,
    String type,
  ) {
    getCartItems.add(plantModel(imageUrl, name, price, type));
    notifyListeners();
  }

  removeItem(String imageUrl, String name, String type, int price) {
    getCartItems.remove(plantModel(imageUrl, name, price, type));
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

//