import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/providers/settings.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({@required this.movieId});

  final int? movieId;
  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.find();
    return FutureBuilder(
        future: movieController.getMovieDetail(movieId),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: kPrimaryColor,
            body: SingleChildScrollView(
              child: snapshot.connectionState != ConnectionState.waiting
                  ? Column(
                      children: [
                        Stack(children: [
                          Container(
                              height: 400,
                              child: Image.network(
                                IMAGEAPI +
                                    movieController.movieDetail!.backdropPath!,
                                fit: BoxFit.cover,
                              )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.bottomCenter,
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      kPrimaryColor,
                                      kPrimaryColor.withOpacity(0.5),
                                      kPrimaryColor.withOpacity(0.0)
                                    ]),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    movieController.movieDetail!.title!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Container(
                                  //   width: 220,
                                  //   child: Text(
                                  //     movieController.movieDetail!.tagline!,
                                  //     textAlign: TextAlign.center,
                                  //     style: GoogleFonts.montserrat(
                                  //       fontSize: 18,
                                  //       color: Colors.white.withOpacity(0.8),
                                  //       fontWeight: FontWeight.normal
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          movieController.movieDetail!.videos!.results!.length > 0
                          ? Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 400,
                              child: InkWell(
                                onTap: (){
                                  
                                },
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              ),
                            ),
                          ) : SizedBox(),
                        ]),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            movieController.movieDetail!.overview!,
                            style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)
                          ),
                        )
                      ],
                    )
                  : Container(),
            ),
          );
        });
  }
}
