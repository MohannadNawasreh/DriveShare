import 'package:drive_share/layout/Log/cubit/cubit.dart';
import 'package:drive_share/layout/Log/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/register_page.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _errorMessage = '';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DSLoginCubit(),
      child:
          BlocConsumer<DSLoginCubit, DSLoginState>(
            listener: (context, state) {
        if (state is DSLoginSuccessState) {
          print("2");
          if (state.T.token == "0") {
            print('object');
            Fluttertoast.showToast(
                msg: "خطأ في الايميل او الباسورد",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else {
            print("3");
            print(state.T.token);
            CacheHelper.saveData(key: 'token', value: state.T.token)
                .then((value) {
              print("4");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              /* Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));*/
            }).catchError((error) {
              print("Error saving data: $error");
              // Handle the error gracefully, e.g., show an error message to the user
            });
            Fluttertoast.showToast(
                msg: "تم تسجيل الدخول ",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Color.fromARGB(255, 3, 184, 78),
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      }, builder: (context, state) {
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
                    ConditionalBuilder(
                      condition: state is! DSLoginLoadingState,
                      builder: (context) => largeButton(
                          text: 'LOGIN',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              DSLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          }),
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
          ),
        );
      }),
    );
  }
}
