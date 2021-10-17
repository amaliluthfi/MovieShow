import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/screens/Homepage/Homepage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.off(Homepage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Container(
          child: SafeArea(
            child: Center(
              child: Image.asset(
                "assets/images/movieShow.png",
                width: MediaQuery.of(context).size.width/2,
              ),
            ),
          ),
        ),
      );
    });
  }
}
