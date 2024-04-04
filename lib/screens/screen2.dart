import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/bloc/user_bloc.dart';
import 'package:flutter_states/models/user.dart';


class Screen2 extends StatelessWidget {
  const Screen2({super.key});


  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

      return Scaffold(
        appBar: AppBar(
          title: const Text('Screen2',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
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
                      'Full Stackd Developers'
                    ]
                  );
                  userBloc.add(ActivateUser(user: newUser));
                },
                child: const Text('Set User', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  userBloc.add(SetUserAge(age: 78));
                },
                child: const Text('Set Years old', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  userBloc.add(AddUserProfession(profession: 'AWS EC2'));
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
