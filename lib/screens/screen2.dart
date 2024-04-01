import 'package:flutter/material.dart';
import 'package:flutter_states/models/services/user_service.dart';
import 'package:flutter_states/models/user.dart';
import 'package:provider/provider.dart';


class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text( 
          userService.existUser ? userService.user.name! : 'Screen2',
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
                  age: 38, 
                  professions: [
                    'Fullstack Developer',
                    'Blockchain Developer',
                    'Flutter Developer',
                    'Ionic PWA Developer',
                  ]
                );
                userService.setUser(newUser);
              },
              child: const Text('Set User', style: TextStyle(color: Colors.white),)
            ),
            MaterialButton(
              color: Colors.teal,
              onPressed: (){
                userService.setAge(78);
              },
              child: const Text('Set Years old', style: TextStyle(color: Colors.white),)
            ),
            MaterialButton(
              color: Colors.teal,
              onPressed: (){
                userService.addProfession('Linux DEV');
              },
              child: const Text('Add Profession', style: TextStyle(color: Colors.white),)
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
