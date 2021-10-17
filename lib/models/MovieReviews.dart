// To parse this JSON data, do
//
//     final movieReviews = movieReviewsFromJson(jsonString);

import 'dart:convert';

MovieReviews movieReviewsFromJson(String str) => MovieReviews.fromJson(json.decode(str));

String movieReviewsToJson(MovieReviews data) => json.encode(data.toJson());

class MovieReviews {
    MovieReviews({
        this.id,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? id;
    int? page;
    List<ResultReviews>? results;
    int? totalPages;
    int? totalResults;

    factory MovieReviews.fromJson(Map<String, dynamic> json) => MovieReviews(
        id: json["id"],
        page: json["page"],
        results: List<ResultReviews>.from(json["results"].map((x) => ResultReviews.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class ResultReviews {
    ResultReviews({
        this.author,
        this.authorDetails,
        this.content,
        this.createdAt,
        this.id,
        this.updatedAt,
        this.url,
    });

    String? author;
    AuthorDetails? authorDetails;
    String? content;
    DateTime? createdAt;
    String? id;
    DateTime? updatedAt;
    String? url;

    factory ResultReviews.fromJson(Map<String, dynamic> json) => ResultReviews(
        author: json["author"],
        authorDetails: AuthorDetails.fromJson(json["author_details"]),
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "author_details": authorDetails!.toJson(),
        "content": content,
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "updated_at": updatedAt!.toIso8601String(),
        "url": url,
    };
}

class AuthorDetails {
    AuthorDetails({
        this.name,
        this.username,
        this.avatarPath,
        this.rating,
    });

    String? name;
    String? username;
    String? avatarPath;
    double? rating;

    factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json["name"],
        username: json["username"],
        avatarPath: json["avatar_path"] == null ? null : json["avatar_path"],
        rating: json["rating"] == null ? null : json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "avatar_path": avatarPath == null ? null : avatarPath,
        "rating": rating == null ? null : rating,
    };
}
