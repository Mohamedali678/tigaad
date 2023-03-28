import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _phoneNumber = '';

  void setUserData(String name, String phoneNumber) {
    _name = name;
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  String get name => _name;
  String get phoneNumber => _phoneNumber;
}
