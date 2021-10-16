import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/screens/Homepage/sections/PopMoviesSection.dart';
import 'package:movie_show/screens/Homepage/sections/genresSection.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GetBuilder<MovieController>(builder: (movieController) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height /4.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Explore by genres",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GenresSection(genres: movieController.genres),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Popular Movies",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PopMoviesSections(movieList: movieController.popMovieList)
                ],
              ),
            ),
          );
        }),
        Positioned(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Hai, User!",
                                style: GoogleFonts.montserrat(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text("Member since 2010",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.6)))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
