import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/components/components.dart';
import 'home_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                height: 10,
              ),
              SizedBox(
                child: Center(
                    child: Image.asset("images/Untitled-2.png",
                        width: 100, height: 100)),
              ),
              SizedBox(
                height: 10,
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
                  keyboardType: TextInputType.name,
                  controller: fnameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 3, 184, 78)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "First Name",
                    prefixIcon: Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 20) {
                      return "First Name cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: lnameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                      hintText: "Last Name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 50) {
                        return "last name cannot be empty";
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "username",
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 20),
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
                        return "email cannot be empty";
                      }
                      return null;
                    }),
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
              Container(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "mobile number",
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length <= 12) {
                        return "mobile number cannot be empty";
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("already have an account? login",
                      style:
                          TextStyle(color: Color.fromARGB(255, 3, 184, 78)))),
              SizedBox(height: 20),
              largeButton(
                  text: "Register",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
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
