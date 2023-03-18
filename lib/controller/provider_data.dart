import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/model/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  List<plantModel> getCartItems = [];

  List<int> amount = [];

  void addToCart(
    String imageUrl,
    String name,
    int price,
    String type,
  ) {
    getCartItems.add(plantModel(imageUrl, name, price, type));

    notifyListeners();
  }

  void incrementAmount() {
    amount.add(1);
    notifyListeners();
  }

  removeItem(String imageUrl, String name, String type, int price) {
    getCartItems.remove(plantModel(imageUrl, name, price, type));
  }

  void updateList(int index) {
    getCartItems.removeAt(index);
    notifyListeners();
  }

  void incrementItem(int i) {
    amount[i]++;
    notifyListeners();
  }

  void decrementItem(int i) {
    if (amount[i] > 1) {
      amount[i]--;
    }

    notifyListeners();
  }

  //getting total price in cart screen.
  getTotalPrice(int i) {
    int cartPrice = 0;
    getCartItems.forEach((element) {
      cartPrice += element.price * amount[i];
    });
    return cartPrice;
  }
}

//