import 'package:flutter/material.dart';
import 'package:s_s_s/features/authentication/presentation/signin_screen.dart';
import 'package:s_s_s/features/dashboard/presentation/dashboard_screen.dart';

import '../../dashboard/constants/utils.dart';
import '../../dashboard/presentation/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const route = '/signUp';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
         // height: MediaQuery.of(context).size.height / 1,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [

              const SizedBox(
                  width: 250,
                  height: 180,
                  child: Image(image: AssetImage("assets/images/logo.png"),)),
              const SizedBox(
                height: 50,
                child: Text('WELCOME', style: MyTextStyle.textStyle4),
              ),
              SizedBox(
                child: Card(
                  elevation: 16,
                  color: ConstColors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Name', style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: nameController,
                                labelText: '',
                              ),
                              const SizedBox(height: 10),
                              const Text('Email',
                                  style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: emailController,
                                labelText: '',
                              ),
                              const SizedBox(height: 10),
                              const Text('Password',
                                  style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: passwordController,
                                labelText: '',
                                icon: const Icon(Icons.remove_red_eye_outlined),
                              ),
                              const SizedBox(height: 10),
                              const Text('Confirm Password',
                                  style: MyTextStyle.textStyle2),
                              const ReUsableTextFField(
                                  labelText: '',
                                  icon: Icon(Icons.remove_red_eye_outlined)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 14,
                          ),
                          child: const Text('Sign Up'),
                          onPressed: () async {
                            // await AuthService().registerUser(
                            //   email: emailController.text,
                            //   password: passwordController.text,
                            // );
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const Dashboard_screen();
                              },
                            ));
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        child: Text(
                          'Already have an account? SIGN IN',
                          style: MyTextStyle.textStyle2
                              .copyWith(color: ConstColors.black),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignInScreen();
                            },
                          ));
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
