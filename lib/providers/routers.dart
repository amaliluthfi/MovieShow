import 'package:get/get.dart';
import 'package:movie_show/screens/Homepage/Homepage.dart';
import 'package:movie_show/screens/Splashscreen.dart';




List<GetPage<dynamic>> routers = [
  GetPage(name: "/", page: () => Splashscreen()),
  GetPage(name: "/homepageRoute", page: () => Homepage())
];
