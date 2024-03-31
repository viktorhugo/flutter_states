

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';

class UserService with ChangeNotifier {
  
  final StreamController<User> _userStream = StreamController.broadcast();
  User? _user;

  //*getters
  User? get user => _user;
  bool get userExist => (_user != null) ? true : false;
  Stream<User> get userStream => _userStream.stream;

  //*setters
  void loadUser({ required User user}) {
    _user = user;
    _userStream.add(user);
  }

  void setAge({required int age}) {
    _user?.age = age;
    _userStream.add(_user!);
  }

  @override
  void dispose() {
    super.dispose();
    _userStream.close();
  }
}

//* este es un singleton, que exporta una unica instancia de una clase en toda la aplicacion 
//* todas la partes donde se ca utilizar simepre es la misma instancia
final  userService = UserService();