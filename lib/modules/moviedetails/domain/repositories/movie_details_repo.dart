// repo abstract
import 'package:route_movies_app/modules/moviedetails/data/models/list_movies_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/data/models/parental_guides_response_model.dart';
import 'package:route_movies_app/modules/moviedetails/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<MovieDetailsEntity> getMovieDetails({
    required String movieId,
    bool withImages = true,
    bool withCast = true,
  });
  Future<List<MovieDetailsEntity>> getRelatedMovies(String movieId);

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
  });

  // ✅ جديد
  Future<List<ParentalGuideModel>> getParentalGuides(String movieId);
}