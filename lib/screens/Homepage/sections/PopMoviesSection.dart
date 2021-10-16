import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/models/PopMovies.dart';
import 'package:movie_show/screens/widgets/PopMovieCard.dart';

class PopMoviesSections extends StatelessWidget {
  const PopMoviesSections({@required this.movieList});

  final List<Movies>? movieList;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: (4 / 2.8),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              movieList!.length,
              (index) {
                Movies movie = movieList![index];
                return PopMovieCard(movie: movie);
              },
            ),
          ),
        )
      ],
    );
  }
}
