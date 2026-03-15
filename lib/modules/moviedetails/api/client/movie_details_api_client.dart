import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/constants/api_constants/end_points.dart';
import '../../data/models/movie_details_response.dart';
import '../../data/models/related_movies_response_model.dart';
import '../../data/models/list_movies_response_model.dart';
import '../../data/models/parental_guides_response_model.dart';

part 'movie_details_api_client.g.dart';

@injectable
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class MovieDetailsApiClient {
  @factoryMethod
  factory MovieDetailsApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) =
      _MovieDetailsApiClient;

  @GET(EndPoints.moviesDetails)
  Future<MovieDetailsResponse> getMovieDetails(
    @Query('movie_id') String movieId,
    @Query('with_images') bool? withImages,
    @Query('with_cast') bool? withCast,
  );

  @GET(EndPoints.relatedMovies)          // ✅ إصلاح الـ // الزيادة
  Future<RelatedMoviesResponse> getRelatedMovies(
    @Query('movie_id') String movieId,
  );

  @GET(EndPoints.listMovies)             // ✅ جديد
  Future<ListMoviesResponse> getListMovies({
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('quality') String? quality,
    @Query('minimum_rating') int? minimumRating,
    @Query('query_term') String? queryTerm,
    @Query('genre') String? genre,
    @Query('sort_by') String? sortBy,
    @Query('order_by') String? orderBy,
    @Query('with_rt_ratings') bool? withRtRatings,
  });

  @GET(EndPoints.parentalGuides)         // ✅ جديد
  Future<ParentalGuidesResponse> getParentalGuides(
    @Query('movie_id') String movieId,
  );
}