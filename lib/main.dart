import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/trips/t1.dart';
import 'package:drive_share/network/remote/dio_helper.dart';
import 'package:drive_share/layout/trips/test_trip.dart';
import 'package:flutter/material.dart';
import 'layout/Log/login_layout.dart';


void main() {
  DioHelper.init();
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 3, 184, 78),
          elevation: 0.0,
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
      //initialRoute: '/',
      /*routes: {
        '/': (context) => const LoginLayout(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const Profile(),
      },*/
    );
  }
}
