import 'package:flutter/cupertino.dart';

import '../model/data.dart';
import '../model/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartOrder> getAllCarts = [];

  void addToCart(plantModel product) {
    getAllCarts.add(CartOrder(product));
    notifyListeners();
  }

  void incrementItem(element) {
    element.quantity++;
    notifyListeners();
  }

  void decrementItem(element) {
    element.quantity--;
    notifyListeners();
  }

  getTotalPrice() {
    int totalPrice = 0;
    getAllCarts.forEach((element) {
      totalPrice += element.product.price * element.quantity;
      print(
          "price: ${element.product.price}, quantity: ${element.quantity}, total price is ${totalPrice}");
    });

    return totalPrice;
  }
}
