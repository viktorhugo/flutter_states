
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/cubit/user_cubit_cubit.dart';
import 'package:flutter_states/models/user.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  @override
  Widget build(BuildContext context) {

    final userCubit = context.read<UserCubit>();

      return  Scaffold(
        appBar: AppBar(
          title: const Text('Screen1',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
          actions: [
            IconButton(
              onPressed: () {
                userCubit.removeUser();
              }, 
              icon: const Icon(Icons.logout_outlined)
            )
          ],
          backgroundColor: Colors.teal,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        
        body: bodyScaffold(),

        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'screen2'),
          child: const Icon(Icons.account_balance_wallet_rounded),
        ),
    );
  }

  BlocBuilder<UserCubit, UserCubitState> bodyScaffold() {
    return BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          print(state);
          if (state is UserCubitInitial) {
            return const Center(child: Text('Not exist user') );
          } else if (state is ActiveUser) {
            return InfoUser(user: state.user,);
          } else {
            return const Center(child: Text('Not exist user') );
          }
        },
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

          ...user.professions.map( (item) {
            return ListTile(title: Text('profession : $item'),);
          })
          
        ],
      ),
    );
  }
}