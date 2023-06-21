import 'package:drive_share/layout/Log/login_layout.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:drive_share/network/remote/dio_helper.dart';
import 'package:drive_share/teest.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
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
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginLayout(),
    );
  }
}