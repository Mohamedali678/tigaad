import 'package:flutter/cupertino.dart';

import '../model/data.dart';
import '../model/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartOrder> getAllCarts = [];

  void addToCart(plantModel product) {
    getAllCarts.add(CartOrder(product));
    notifyListeners();
  }
}
