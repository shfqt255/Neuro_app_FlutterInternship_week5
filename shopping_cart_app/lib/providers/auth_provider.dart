import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _currentUser;

  String? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  void login(String username) {
    _currentUser = username;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
