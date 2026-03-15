import 'package:injectable/injectable.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/list_movies_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/parental_guides_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/domain/entities/movie_details_entity.dart';
import '../repositories/movie_details_repo.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepo _repository;
  GetMovieDetailsUseCase(this._repository);

  Future<MovieDetailsEntity> call({
    required String movieId,
    bool withImages = true,
    bool withCast = true,
  }) async {
    return await _repository.getMovieDetails(
      movieId: movieId,
      withImages: withImages,
      withCast: withCast,
    );
  }

  Future<List<MovieDetailsEntity>> getRelatedMovies(String movieId) async {
    return await _repository.getRelatedMovies(movieId);
  }

  // ✅ جديد
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
    return await _repository.getListMovies(
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
  }

  // ✅ جديد
  Future<List<ParentalGuideModel>> getParentalGuides(String movieId) async {
    return await _repository.getParentalGuides(movieId);
  }
}