import 'package:route_movies_app/modules/moviedetails/data/models/movie_details_model.dart';

class ListMoviesResponse {
  final String status;
  final String statusMessage;
  final ListMoviesData data;

  ListMoviesResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory ListMoviesResponse.fromJson(Map<String, dynamic> json) =>
      ListMoviesResponse(
        status: json['status'] ?? '',
        statusMessage: json['status_message'] ?? '',
        data: ListMoviesData.fromJson(json['data']),
      );
}

class ListMoviesData {
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<MovieDetailsModel> movies;

  ListMoviesData({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory ListMoviesData.fromJson(Map<String, dynamic> json) => ListMoviesData(
        movieCount: json['movie_count'] ?? 0,
        limit: json['limit'] ?? 20,
        pageNumber: json['page_number'] ?? 1,
        movies: (json['movies'] as List<dynamic>? ?? [])
            .map((e) => MovieDetailsModel.fromJson(e))
            .toList(),
      );
}