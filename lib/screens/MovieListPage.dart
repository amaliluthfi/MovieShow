import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/models/MovieByGenre.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/screens/widgets/MovieCard.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({this.genreId, this.genreName});

  final int? genreId;
  final String? genreName;

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final MovieController movieController = Get.find();
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      // var scrollTreshold = _scrollController.position.minScrollExtent -
      //     _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          movieController.movieList!.page! >= 1 &&
          movieController.movieList!.page! <=
              movieController.movieList!.totalPages!) {
        movieController
            .getMoviesByGenres(
                widget.genreId, movieController.movieList!.page! + 1)
            .catchError((e) {
          Get.snackbar("Error", "Cannot get more movies",
              colorText: Colors.white, backgroundColor: kRedError);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    movieController.movies = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.genreName!,
            style: GoogleFonts.montserrat(),
          ),
        ),
        body: GetBuilder<MovieController>(builder: (movieController) {
          return SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GridView.count(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: (2.8 / 4),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: List.generate(
                          movieController.movies!.length,
                          (index) {
                            Result movie = movieController.movies![index];
                            return MovieCard(movie: movie);
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Obx(() => movieController.isLoading.value
                          ? Center(
                              child:
                                  Container(child: CircularProgressIndicator()))
                          : SizedBox())
                    ],
                  )));
        }));
  }
}
