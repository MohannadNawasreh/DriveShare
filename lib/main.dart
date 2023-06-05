import 'package:drive_share/layout/Log/login_layout.dart';
import 'package:drive_share/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*Eyasss */
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginLayout(),
      //initialRoute: '/',
      /*routes: {
        '/': (context) => const LoginLayout(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const Profile(),
      },*/
    );
  }
}
