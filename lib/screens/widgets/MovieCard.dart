import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_show/models/MovieByGenre.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/providers/settings.dart';
import 'package:movie_show/screens/MovieDetail.dart/MovieDetail.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({@required this.movie});

  final Result? movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetailPage(
          movieId: movie!.id!,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.2,
                  blurRadius: 10,
                  color: kPrimaryColor.withOpacity(0.2))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  IMAGEAPI + movie!.posterPath!,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                          kPrimaryColor,
                          kPrimaryColor.withOpacity(0.5),
                          kPrimaryColor.withOpacity(0.0)
                        ])),
                    child: Text(movie!.title!,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
