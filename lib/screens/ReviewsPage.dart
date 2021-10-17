import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_show/controllers/MovieController.dart';
import 'package:movie_show/models/MovieReviews.dart';
import 'package:movie_show/providers/colors.dart';
import 'package:movie_show/providers/helpers.dart';
import 'package:movie_show/providers/settings.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({this.movieId});

  final int? movieId;

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final ScrollController _scrollController = new ScrollController();
  final MovieController movieController = Get.find();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          movieController.movieReviews!.page! >= 1 &&
          movieController.movieReviews!.page! <=
              movieController.movieReviews!.totalPages!) {
        movieController.getMovieReviews(
            widget.movieId, movieController.movieReviews!.page! + 1);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    movieController.reviews = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(builder: (movieController) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Reviews",
              style: GoogleFonts.montserrat(),
            ),
          ),
          body: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: movieController.reviews!.length,
              itemBuilder: (BuildContext context, int index) {
                ResultReviews review = movieController.reviews![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kPrimaryColor, width: 1)
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                review.authorDetails!.avatarPath != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(review
                                                .authorDetails!.avatarPath!
                                                .contains('/http')
                                            ? review.authorDetails!.avatarPath!
                                                .substring(
                                                    1,
                                                    review.authorDetails!.avatarPath!
                                                            .length -
                                                        1)
                                            : IMAGEAPI +
                                                review.authorDetails!.avatarPath!))
                                    : CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            review.authorDetails!.username!,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: kPrimaryColor
                                            ),
                                          ),
                                          Text("written by ${review.authorDetails!.username!}",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            color: Colors.black.withOpacity(0.7)
                                          ),)
                                        ],
                                      ),
                                      
                              ],
                            ),
                            Text("${dateFormat(review.updatedAt!)}",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            color: Colors.black.withOpacity(0.7)
                                          ),)
                          ],
                        ),
                        Divider(color: kPrimaryColor,),
                        SizedBox(height: 5),
                        Text(
                          review.content!,
                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: Colors.black
                                          )
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ));
    });
  }
}
