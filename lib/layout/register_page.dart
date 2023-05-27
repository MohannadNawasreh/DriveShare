import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/components/components.dart';
import 'home_page.dart';
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
                        return "email cannot be empty";
                      }
                      return null;
                    }),
              ),
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
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.phone,
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
                      if (value!.isEmpty || value.length >= 12) {
                        return "mobile number cannot be empty";
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
              largeButton(
                  text: "Register",
                  /*  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                  }),*/
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {

                        var url = Uri.parse(
                            'https://10.0.2.2:44325/api/User/createuser');

                        // Bypass certificate check
                        HttpClient client = new HttpClient()
                          ..badCertificateCallback =
                              ((X509Certificate cert, String host, int port) =>
                                  true);

                        HttpClientRequest request = await client.postUrl(url);

                        request.headers.set(
                            'content-type', 'application/json; charset=UTF-8');

                        // Define the data to be sent
                        Map<String, String> data = {
                          'fname': 'safffdsa',
                          'lname': 'wyas333',
                          'phonenumber': '5563333325',
                          'username': 'mahmou1dddddd1155521',
                          'imagefile': 'ddddddd',
                          'useremail': 'mahmoudddhefaw0@gmasadadil.com',
                          'userpass': '1234567dd89sadasda',
                        };

                        // Convert the data to JSON and add it to the body of the request
                        String payload = jsonEncode(data);
                        print('Payload: $payload');
                        request.write(payload);

                        // Send the request
                        HttpClientResponse response = await request.close();

                        // Get the response body
                        var responseBody =
                            await response.transform(utf8.decoder).join();

                        print('Response status: ${response.statusCode}');
                        print('Response body: $responseBody');

                        if (response.statusCode == 200) {
                          print('User created successfully');
                        } else {
                          print('Failed to create user');
                        }
                      } catch (e) {
                        print('There was an error: $e');
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
