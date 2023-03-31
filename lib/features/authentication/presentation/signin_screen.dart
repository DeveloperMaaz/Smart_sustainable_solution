import 'package:flutter/material.dart';
import 'package:s_s_s/features/authentication/presentation/signup_screen.dart';
import 'package:s_s_s/features/dashboard/presentation/dashboard_screen.dart';

import '../../dashboard/constants/utils.dart';
import '../../dashboard/presentation/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const route = '/signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
                width: 250,
                height: 180,
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: ListView(
                children: [
                  Text('Hello !',
                      style: MyTextStyle.textStyle3
                          .copyWith(color: ConstColors.black2)),
                  const Text('WELCOME BACK', style: MyTextStyle.textStyle4),
                ],
              ),
            ),
            SizedBox(
              child: Card(
                elevation: 16,
                color: ConstColors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Email',
                                  style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: emailController,
                                labelText: '',
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                'Password',
                                style: MyTextStyle.textStyle2,
                              ),
                              ReUsableTextFField(
                                controller: passwordController,
                                labelText: '',
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Forgot Password',
                        style: MyTextStyle.textStyle2
                            .copyWith(fontWeight: FontWeight.w600),
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
                          child: const Text('Log In'),
                          onPressed: () async {
                            // await AuthService().emailLogin(
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
                          'SIGN UP',
                          style: MyTextStyle.textStyle2
                              .copyWith(color: ConstColors.black),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ));
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
