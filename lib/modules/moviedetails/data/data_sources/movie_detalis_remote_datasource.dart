import '../models/movie_details_model.dart';
import '../models/list_movies_response_model.dart';
import '../models/parental_guides_response_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(
    String movieId,
    bool? withImages,
    bool? withCast,
  );

  Future<List<MovieDetailsModel>> getRelatedMovies(String movieId);

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