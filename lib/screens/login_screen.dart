import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts/screens/home_screen.dart';
import 'package:uts/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -45,
            left: -45,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
          Positioned(
            top: 180,
            right: -90,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kBigPadding),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset(
                  'assets/illustrations/splash/login.svg',
                  height: 300,
                ),
                const SizedBox(height: kBigPadding),
                isSignUp
                    ? const TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: kDefaultTextSize + 2,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultBorderRadius),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kDefaultBorderRadius),
                            ),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                              width: 1.5,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                isSignUp ? const SizedBox(height: kDefaultPadding) : Container(),
                const TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: kDefaultTextSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(kDefaultBorderRadius),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black38,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(kDefaultBorderRadius),
                      ),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: kDefaultTextSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(kDefaultBorderRadius),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black38,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(kDefaultBorderRadius),
                      ),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ),
                          );
                        },
                        style: !isSignUp
                            ? const ButtonStyle()
                            : const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                                elevation: MaterialStatePropertyAll(0),
                              ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: kMediumTextSize - 2),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: kBigPadding),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isSignUp = !isSignUp;
                          });
                        },
                        style: isSignUp
                            ? const ButtonStyle()
                            : const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                                elevation: MaterialStatePropertyAll(0),
                              ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: kMediumTextSize - 2),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Learnywhere 1.0.0',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kMediumTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
