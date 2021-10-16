import 'package:get/get.dart';
import 'package:movie_show/models/MovieByGenre.dart';
import 'package:movie_show/models/MovieDetail.dart';
import 'package:movie_show/models/PopMovies.dart';
import 'package:movie_show/providers/settings.dart';
import 'package:movie_show/services/networkServices.dart';

class MovieController extends GetxController {
  List<Movies> popMovieList = [];
  MoviesByGenre? movieList;
  MovieDetail? movieDetail;
  List<Result>? movies = [];
  List genres = [];

  @override
  void onInit() {
    getPopMovies();
    getGenres();
    super.onInit();
  }

  Future<List<Movies>> getPopMovies() async {
    try {
      var url =
          "$MOVIEDBAPI/movie/popular?api_key=$APIKEY&language=en-US&page=1";
      NetworkHelpers getMovies = NetworkHelpers(url, headers: {
        "Content-Type": 'application/json',
      });

      var response = await getMovies.getData();
      print("ini response 1 $response");
      popMovieList = [];

      response['results'].forEach((el) {
        popMovieList.add(Movies.fromJson(el));
      });
      return popMovieList;
    } catch (e) {
      print("ini error $e");
      throw e;
    }
  }

  Future<List<dynamic>> getGenres() async {
    try {
      var url = "$MOVIEDBAPI/genre/movie/list?api_key=$APIKEY&language=en-US";
      NetworkHelpers getMovies = NetworkHelpers(url, headers: {
        "Content-Type": 'application/json',
      });

      var response = await getMovies.getData();
      print("ini response 1 $response");
      genres = response['genres'];
      return genres;
    } catch (e) {
      print("ini error $e");
      throw e;
    }
  }

  Future<MoviesByGenre> getMoviesByGenres(genreId, page) async {
    try {
      print(genreId);
      var url =
          "$MOVIEDBAPI/discover/movie?api_key=$APIKEY&language=en-US&sort_by=popularity.desc&with_genres=$genreId&page=$page";
      NetworkHelpers getMovies = NetworkHelpers(url, headers: {
        "Content-Type": 'application/json',
      });

      var response = await getMovies.getData();
      movieList = MoviesByGenre.fromJson(response);
      movieList!.results!.forEach((element) {
        movies!.add(element);
      });
      update();
      return movieList!;
    } catch (e) {
      print("ini error $e");
      throw e;
    }
  }

  Future<MovieDetail> getMovieDetail(movieId) async {
    try {
      var url =
          "$MOVIEDBAPI/movie/$movieId?api_key=$APIKEY&language=en-USie=UTF-8&append_to_response=videos";
      NetworkHelpers getMovie = NetworkHelpers(url, headers: {
        "Content-Type": 'application/json',
      });

      var response = await getMovie.getData();
      print(response);
      movieDetail = MovieDetail.fromJson(response);
      update();
      return movieDetail!;
    } catch (e) {
      print("ini error $e");
      throw e;
    }
  }
}
