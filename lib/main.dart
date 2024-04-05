import 'package:flutter/material.dart';
import 'package:flutter_states/screens/screen1.dart';
import 'package:flutter_states/screens/screen2.dart';
import 'package:get/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/screen1',
      
      getPages: [
        GetPage(name: '/screen1', page: () => const Screen1()),
        GetPage(name: '/screen2', page: () => const Screen2())
      ],
    );
  }
}