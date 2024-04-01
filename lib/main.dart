import 'package:flutter/material.dart';
import 'package:flutter_states/models/services/user_service.dart';
import 'package:flutter_states/screens/screen1.dart';
import 'package:flutter_states/screens/screen2.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ // si lazy es false va crear la instancia apenas inice el arbol de widgets de lo contrario solo espera ser inicializada
        ChangeNotifierProvider(lazy: true, create: (context) => UserService() )
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