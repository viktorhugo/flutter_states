import 'package:flutter_states/models/user.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController{
  
  RxBool existUser = false.obs;
  Rx<User> user = User(
    name: '', 
    age: 0, 
    professions: []
  ).obs;

  void setUser({required User newUser}) {
    user.value = newUser;
    existUser.value = true;
  }

  void setAge({required int age}) {
    user.value = user.value.copyWith(age: age);
    // user.update((val) { 
    //   val!.age = age;
    // });
  }
  
  void addProfession({required String profession}) {
    user.value = user.value.copyWith(professions: [...user.value.professions, profession]);
    // user.update((val) { 
    //   val!.age = age;
    // });
  }

  void removeUser() {
    user.value = user.value.copyWith(
      name: '', 
      age: 0, 
      professions: []
    );
    existUser.value = false;
  }
}