
import 'package:flutter/material.dart';
import 'package:flutter_states/models/services/user_service.dart';
import 'package:flutter_states/models/user.dart';
import 'package:provider/provider.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  @override
  Widget build(BuildContext context) {

    final userService = Provider.of<UserService>(context, listen: true);

      return  Scaffold(
        appBar: AppBar(
          title: const Text('Screen1',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
          actions: [
            IconButton(
              onPressed: () => userService.removeUser(), 
              icon: const Icon(Icons.exit_to_app)
            )
          ],
          backgroundColor: Colors.teal,
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        body: userService.existUser 
          ? InfoUser( user: userService.user )
          : const Center(child: Text('Not user selected'),),

        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'screen2'),
          child: const Icon(Icons.account_balance_wallet_rounded),
        ),
    );
  }
}

class InfoUser extends StatelessWidget {

  final User user;

  const InfoUser({
    super.key,
    required this.user,
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

          // const ListTile(title: Text('profession 1:'),),
          ...user.professions!.map((item) => ListTile(
            title: Text( item, style: const TextStyle(color: Colors.black),),
          )),

        ],
      ),
    );
  }
}