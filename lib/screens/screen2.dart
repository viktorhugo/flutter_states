import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/cubit/user_cubit_cubit.dart';
import 'package:flutter_states/models/user.dart';


class Screen2 extends StatelessWidget {
  const Screen2({super.key});


  @override
  Widget build(BuildContext context) {

    final userCubit = context.read<UserCubit>();

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
                      'Fullstack Developer',
                      'XRP Developer',
                      'Flutter Developer'
                    ]
                  );
                  userCubit.setUser(user: newUser);
                },
                child: const Text('Set User', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){

                },
                child: const Text('Set Years old', style: TextStyle(color: Colors.white),)
              ),
              MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  
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
