
import 'package:flutter/material.dart';
import 'package:flutter_states/controllers/user_controller.dart';
import 'package:flutter_states/models/user.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  @override
  Widget build(BuildContext context) {

    final userController = Get.put(UserController()); //* inject controller

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Screen1',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: () {
            userController.removeUser();
          }, 
          icon: const Icon(Icons.logout_outlined)
        )
        ],
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Obx(
        () => userController.existUser.value
          ? InfoUser(user: userController.user.value,)
          : const Center(child: Text('No user selected'),)
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          'screen2', 
          arguments: {
            'name': 'Victor mosquera',
            'age': 45
          }
        ),
        child: const Icon(Icons.account_balance_wallet_rounded),
      ),
    );
  }
}

class InfoUser extends StatelessWidget {

  final User user;

  const InfoUser({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {


    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold) ),
          const Divider(),

          ListTile(title: Text('Name: ${user.name}'),),
          ListTile(title: Text('Years old: ${user.age}'),),

          const Text('Professions', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold) ),
          const Divider(),

          ...user.professions.map((profession) {
            return ListTile(title: Text('profession: $profession'));
          })
        ],
      ),
    );
  }
}