import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/providers/routers.dart';
import 'package:movie_show/screens/Splashscreen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Get.put(MovieController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Show',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: routers,
      home: Splashscreen(),
    );
  }
}
