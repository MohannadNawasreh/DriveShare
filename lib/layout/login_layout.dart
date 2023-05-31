import 'dart:convert';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/register_page.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> loginUser() async {
    var url = Uri.parse('http://localhost:44325/api/User/login');
    var body = json.encode({
      "Email": emailController.text,
      "Password": passwordController.text,
    });

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        // Login successful, handle the response
        var jsonResponse = json.decode(response.body);
        // Process the response data

        // Example: Retrieve the access token
        var accessToken = jsonResponse['access_token'];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        // Perform any necessary actions after login
        // ...
      } else {
        // Login failed, handle the error
        print('Login failed with status code ${response.statusCode}');

        // Example: Retrieve the error message
        var errorMessage = json.decode(response.body)['message'];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Register()),
        );

        // Handle the error accordingly
        // ...
      }
    } catch (error) {
      // Error occurred during the HTTP request
      print('Error: $error');

      // Handle the error accordingly
      // ...
    }
  }

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
                const SizedBox(height: 100),
                SizedBox(
                  child: Center(
                    child: Image.asset(
                      "images/Untitled-2.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Let's Sign you in",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 3, 184, 78),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome back, you have been missed!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 3, 184, 78),
                        ),
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
                      }
                      return null;
                    },
                  ),
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
                          color: Color.fromARGB(255, 3, 184, 78),
                        ),
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
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Register",
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 184, 78),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                largeButton(
                    text: 'LOGIN',
                    onPressed: () async {
                     if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                     }}
                ),
                      //  loginUser();

                      /*  var headers = {'Content-Type': 'application/json'};
                      var request = http.Request('POST',
                          Uri.parse('https://localhost:44325/api/User/login'));
                      request.body = json.encode({
                        "email": "moayadmohammad2001@gmail.com",
                        "password": "123456789"
                      });
                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 200) {
                        print(await response.stream.bytesToString());
                      } else {
                        print(response.reasonPhrase);
                      }*/
                  
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
