import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';

class UserService with ChangeNotifier {
  
  User? _user;

  //Getters
  User get user => _user!;
  bool get existUser => (_user != null) ? true : false;

  //Setters
  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  void setAge( int age ) {
    _user?.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession( String profession ) {
    _user?.professions!.add(profession);
    notifyListeners();
  }
}