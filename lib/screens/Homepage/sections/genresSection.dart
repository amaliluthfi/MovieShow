import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/screens/MovieListPage.dart';
import 'package:get/get.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({@required this.genres});

  final List? genres;
  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.find();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: (1 / 4),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        scrollDirection: Axis.horizontal,
        children: List.generate(genres!.length, (index) {
          var genre = genres![index];
          return InkWell(
            onTap: () {
              movieController.getMoviesByGenres(genre['id'], 1).then((value) {
                Get.to(MovieListPage(
                  genreId: genre['id'],
                  genreName: genre['name'],
                ));
              }).catchError((e) {
                Get.snackbar("Error", "Cannot get reviews",
                    colorText: Colors.white, backgroundColor: kRedError);
              });
            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  genre['name'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
