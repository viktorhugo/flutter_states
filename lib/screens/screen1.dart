
import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Screen1',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
          actions: const [],
          backgroundColor: Colors.teal,
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        body: StreamBuilder( //* with streams 
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {

            return snapshot.hasData
            ? InfoUser(user: snapshot.data!,)
            : const Center(
                child: Text('No user information'),
              );
          },
        ),
        
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

          const ListTile(title: Text('profession 1:'),),
          const ListTile(title: Text('profession 2:'),),
          const ListTile(title: Text('profession e:'),),
        ],
      ),
    );
  }
}