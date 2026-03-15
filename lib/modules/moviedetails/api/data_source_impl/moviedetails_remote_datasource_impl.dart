import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/moviedetails/api/client/movie_details_api_client.dart';
import 'package:route_movies_app/modules/moviedetails/data/data_sources/movie_detalis_remote_datasource.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/list_movies_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/movie_details_model.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/parental_guides_response_model.dart';

@LazySingleton(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final MovieDetailsApiClient movieDetailsApiClient;
  MovieDetailsRemoteDataSourceImpl(this.movieDetailsApiClient);

  @override
  Future<MovieDetailsModel> getMovieDetails(
    String movieId,
    bool? withImages,
    bool? withCast,
  ) async {
    final response = await movieDetailsApiClient.getMovieDetails(
      movieId,
      withImages,
      withCast,
    );
    return response.data.movie;
  }

  @override
  Future<List<MovieDetailsModel>> getRelatedMovies(String movieId) async {
    final response = await movieDetailsApiClient.getRelatedMovies(movieId);
    return response.data.movies;
  }

  // ✅ جديد
  @override
  Future<ListMoviesData> getListMovies({
    int? limit,
    int? page,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
    bool? withRtRatings,
  }) async {
    final response = await movieDetailsApiClient.getListMovies(
      limit: limit,
      page: page,
      quality: quality,
      minimumRating: minimumRating,
      queryTerm: queryTerm,
      genre: genre,
      sortBy: sortBy,
      orderBy: orderBy,
      withRtRatings: withRtRatings,
    );
    return response.data;
  }

  // ✅ جديد
  @override
  Future<List<ParentalGuideModel>> getParentalGuides(String movieId) async {
    final response = await movieDetailsApiClient.getParentalGuides(movieId);
    return response.data.parentalGuides;
  }
}