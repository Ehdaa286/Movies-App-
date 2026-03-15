import 'movie_details_model.dart';

class RelatedMoviesResponse {
  final RelatedMoviesData data;

  RelatedMoviesResponse({required this.data});

  factory RelatedMoviesResponse.fromJson(Map<String, dynamic> json) =>
      RelatedMoviesResponse(
        data: RelatedMoviesData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {'data': data.toJson()};
}

class RelatedMoviesData {
  final List<MovieDetailsModel> movies;

  RelatedMoviesData({required this.movies});

  factory RelatedMoviesData.fromJson(Map<String, dynamic> json) =>
      RelatedMoviesData(
        movies: (json['movies'] as List<dynamic>? ?? [])
            .map((e) => MovieDetailsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'movies': movies.map((e) => e.toJson()).toList(),
      };
}