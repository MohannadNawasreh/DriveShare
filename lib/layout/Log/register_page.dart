import 'dart:convert';
import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/Log/login_layout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/components/components.dart';
import '../home_page.dart';
import 'dart:io';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
  String _gender = '';

  bool flag = true;

  String _errorMessage = '';

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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Center(
                    child: Image.asset("images/Untitled-2.png",
                        width: 100, height: 100)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Let's Sign you in",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 3, 184, 78))),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome back, you have been missed!",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: fnameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 3, 184, 78)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "First Name",
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        (value.length > 20 && value.length < 3)) {
                      return "First Name cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: lnameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                      hintText: "Last Name",
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          (value.length > 20 && value.length < 3)) {
                        return "last name cannot be empty";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "username",
                      prefixIcon: const Icon(
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
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Gender'),
                  RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 3, 184, 78)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Email",
                        prefixIcon: const Icon(
                          Icons.email,
                          size: 20,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})?$")
                            .hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      })),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (!RegExp(
                              r"^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$")
                          .hasMatch(value)) {
                        return "Password must 8 characters, numbers, and special characters";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "mobile number",
                      prefixIcon: const Icon(
                        Icons.phone,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone number cannot be empty";
                      } else if (!RegExp(r"^(77|78|79)\d{7}$")
                          .hasMatch(value)) {
                        return "Must be starting with 77, 78, or 79 and length is 9 digits";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("already have an account? login",
                      style:
                          TextStyle(color: Color.fromARGB(255, 3, 184, 78)))),
              const SizedBox(height: 20),
              ConditionalBuilder(
                condition: flag,
                builder: (context) => largeButton(
                  text: "Register",
                  onPressed: () async {
                    setState(() {
                      _errorMessage = '';
                      flag = false;
                    });

                    if (formKey.currentState!.validate()) {
                      var headers = {
                        'Content-Type': 'application/json',
                        'Cookie':
                            'ARRAffinity=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b; ARRAffinitySameSite=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b'
                      };

                      var request = http.Request(
                        'POST',
                        Uri.parse(
                          'https://driveshare.azurewebsites.net/api/User/createuser',
                        ),
                      );
                      request.body = json.encode({
                        "fname": fnameController.text,
                        "lname": lnameController.text,
                        "PHONENUMBER": phoneController.text,
                        "USERNAME": emailController.text,
                        "IMAGEFILE": imageController.text,
                        "email": emailController.text,
                        "password": passwordController.text,
                        "gender": _gender.toString()
                      });
                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 200) {
                        print(await response.stream.bytesToString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginLayout(),
                          ),
                        );
                      } else {
                        var errorMessage =
                            'Register is Failed, Your Information Already Exists';

                        print(response.statusCode);
                        setState(() {
                          _errorMessage = errorMessage;
                          flag = true;
                        });
                      }
                    } else {
                      setState(() {
                        flag = true;
                      });
                    }
                  },
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(height: 10.0),
              Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
