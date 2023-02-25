import 'package:dhir_app/model/data.dart';
import 'package:dhir_app/model/data_brain.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  List<DataBrain> getCartItems = [
    DataBrain("assets/images/favorite1.png", "Spider Plant", 3),
    DataBrain("assets/images/favorite2.png", "Song of india", 4),
  ];

  void addToCart(String imageUrl, String name, double price) {
    getCartItems.add(DataBrain(imageUrl, name, price));

    notifyListeners();
  }

  void removeItem(String imageUrl, String name, double price) {
    getCartItems.remove(DataBrain(imageUrl, name, price));

    notifyListeners();
  }
}
