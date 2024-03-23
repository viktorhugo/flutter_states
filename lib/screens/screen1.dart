
import 'package:flutter/material.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: const Text('Screen1'),
          actions: const [],
        ),
        body: const InfoUser(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'screen2'),
          child: const Icon(Icons.account_balance_wallet_rounded),
        ),
    );
  }
}

class InfoUser extends StatelessWidget {
  const InfoUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold) ),
          Divider(),

          ListTile(title: Text('Name:'),),
          ListTile(title: Text('Years old:'),),

          Text('Professions', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold) ),
          Divider(),

          ListTile(title: Text('profession 1:'),),
          ListTile(title: Text('profession 2:'),),
          ListTile(title: Text('profession e:'),),
        ],
      ),
    );
  }
}