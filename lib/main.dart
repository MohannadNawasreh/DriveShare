import 'package:drive_share/layout/home_page.dart';
import 'package:flutter/material.dart';
import 'layout/login_layout.dart';
import 'layout/register_page.dart';


import 'layout/profile.dart';void main() {
  
  runApp(const MyApp());
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
      home:const LoginLayout(),
      //initialRoute: '/',
      /*routes: {
        '/': (context) => const LoginLayout(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const Profile(),
      },*/
      
    );
    
  }
}