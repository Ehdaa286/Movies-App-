import 'movie_details_model.dart';

class MovieDetailsResponse {
  final MovieDetailsData data;

  MovieDetailsResponse({required this.data});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      MovieDetailsResponse(
        data: MovieDetailsData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {'data': data.toJson()};
}

class MovieDetailsData {
  final MovieDetailsModel movie;

  MovieDetailsData({required this.movie});

  factory MovieDetailsData.fromJson(Map<String, dynamic> json) =>
      MovieDetailsData(
        movie: MovieDetailsModel.fromJson(json['movie']),
      );

  Map<String, dynamic> toJson() => {'movie': movie.toJson()};
}