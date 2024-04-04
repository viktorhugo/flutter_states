import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/bloc/user_bloc.dart';
import 'package:flutter_states/screens/screen1.dart';
import 'package:flutter_states/screens/screen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(),)
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'screen1',
        
        routes: {
          'screen1': (context) => const Screen1(),
          'screen2': (context) => const Screen2()
        },
      ),
    );
  }
}