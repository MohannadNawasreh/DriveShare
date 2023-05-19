import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/register_page.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/providers/passanger_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';


class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final passengerProvider = Provider.of<PassengerProvider>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                child: Center(
                    child: Image.asset("images/Untitled-2.png",
                        width: 100, height: 100)),
              ),
              SizedBox(
                height: 40,
              ),
              Text("Let's Sign you in",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 3, 184, 78))),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome back, you have been missed!",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 3, 184, 78)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text("don't have an account? register",
                      style:
                          TextStyle(color: Color.fromARGB(255, 3, 184, 78))
                          )
                        ),
              SizedBox(height: 20),
              largeButton(
                  text: "LOGIN",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                      
                      //passengerProvider.login(emailController.text, passwordController.text);
                      //Navigator.pushReplacementNamed(context, '/home_page');
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

/*
TextField(
  decoration: InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.greenAccent),//<-- SEE HERE
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xffF02E65)),//<-- SEE HERE
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 66, 125, 145)),//<-- SEE HERE
    ),
  ),
),*/