// repo impl
import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/moviedetails/data/data_sources/movie_detalis_remote_datasource.dart';
import 'package:route_movies_app/modules/moviedetails/data/mapper/movie_detailes_mapper.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/list_movies_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/parental_guides_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/domain/entities/movie_details_entity.dart';
import 'package:route_movies_app/modules/moviedetails/domain/repositories/movie_details_repo.dart';

@LazySingleton(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsRemoteDataSource _remoteDataSource;
  MovieDetailsRepoImpl(this._remoteDataSource);

  @override
  Future<MovieDetailsEntity> getMovieDetails({
    required String movieId,
    bool withImages = true,
    bool withCast = true,
  }) async {
    final model = await _remoteDataSource.getMovieDetails(
      movieId, withImages, withCast,
    );
    return model.toEntity();
  }

  @override
  Future<List<MovieDetailsEntity>> getRelatedMovies(String movieId) async {
    final models = await _remoteDataSource.getRelatedMovies(movieId);
    return models.map((e) => e.toEntity()).toList();
  }

  // ✅ جديد
  @override
  Future<ListMoviesData> getListMovies({
    int? limit, int? page, String? quality,
    int? minimumRating, String? queryTerm,
    String? genre, String? sortBy,
    String? orderBy, bool? withRtRatings,
  }) => _remoteDataSource.getListMovies(
        limit: limit, page: page, quality: quality,
        minimumRating: minimumRating, queryTerm: queryTerm,
        genre: genre, sortBy: sortBy,
        orderBy: orderBy, withRtRatings: withRtRatings,
      );

  // ✅ جديد
  @override
  Future<List<ParentalGuideModel>> getParentalGuides(String movieId) =>
      _remoteDataSource.getParentalGuides(movieId);
}