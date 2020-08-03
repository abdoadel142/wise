import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wise/Screens/Regester_Screen.dart';
import 'package:wise/Screens/home_screen.dart';

class Splash_screen extends StatefulWidget {
  static const id = 'splashScreen';

  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      checkLogin();
    });

    super.initState();
  }

  checkLogin() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (user != null) {
      Navigator.pushReplacementNamed(context, home.id);
    } else {
      Navigator.pushReplacementNamed(context, Regester_Screen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
          child: Image.asset(
        'images/logoDark.png',
        height: 200,
      )),
    );
  }
}
