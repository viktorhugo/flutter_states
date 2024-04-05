import 'package:flutter/material.dart';
import 'package:flutter_states/controllers/user_controller.dart';
import 'package:flutter_states/models/user.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';


class Screen2 extends StatelessWidget {
  const Screen2({super.key});


  @override
  Widget build(BuildContext context) {

    print(Get.arguments);
    final userController = Get.find<UserController>();

      return Scaffold(
        appBar: AppBar(
          title: Text(
            userController.user.value.name ,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: const [],
          backgroundColor: Colors.teal,
          iconTheme: const IconThemeData(color: Colors.white),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  final newUser = User(
                    name: 'Victor Mosquera',
                    age: 40,
                    professions: [
                      'Full Stack Developers'
                    ]
                  );
                  userController.setUser(newUser: newUser);
                  Get.snackbar(
                    ' Set User',
                    '${newUser.name} is new user',
                    icon: const Icon(Icons.verified_user_rounded),
                    colorText: Colors.white,
                    snackPosition: SnackPosition.TOP,
                    boxShadows: [
                      const BoxShadow(
                        color: Colors.black38,
                        blurRadius: 1
                      )
                    ]
                  );
                },
                child: const Text('Set User', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  userController.setAge(age: 78);
                },
                child: const Text('Set Years old', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  userController.addProfession(profession: 'VC TOmae');
                },
                child: const Text('Add Profession', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                child: const Text('Change Theme', style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Navigator.pushNamed(context, 'screen1'),
        //   child: const Icon(Icons.account_balance_wallet_rounded),
        // ),
    );
  }
}
