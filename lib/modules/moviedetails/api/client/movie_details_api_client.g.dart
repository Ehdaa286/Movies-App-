// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'movie_details_api_client.dart';

class _MovieDetailsApiClient implements MovieDetailsApiClient {
  _MovieDetailsApiClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  });

  final Dio _dio;
  String? baseUrl;
  final ParseErrorLogger? errorLogger;

  @override
  Future<MovieDetailsResponse> getMovieDetails(
    String movieId,
    bool? withImages,
    bool? withCast,
  ) async {
    final queryParameters = <String, dynamic>{
      'movie_id': movieId,
      if (withImages != null) 'with_images': withImages,
      if (withCast != null) 'with_cast': withCast,
    };
    final _options = _setStreamType<MovieDetailsResponse>(
      Options(method: 'GET')
          .compose(_dio.options, '/movie_details.json',
              queryParameters: queryParameters)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MovieDetailsResponse _value;
    try {
      _value = MovieDetailsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RelatedMoviesResponse> getRelatedMovies(String movieId) async {
    final queryParameters = <String, dynamic>{'movie_id': movieId};
    final _options = _setStreamType<RelatedMoviesResponse>(
      Options(method: 'GET')
          .compose(_dio.options, '/movie_suggestions.json',
              queryParameters: queryParameters)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RelatedMoviesResponse _value;
    try {
      _value = RelatedMoviesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ListMoviesResponse> getListMovies({
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
    final queryParameters = <String, dynamic>{
      if (limit != null) 'limit': limit,
      if (page != null) 'page': page,
      if (quality != null) 'quality': quality,
      if (minimumRating != null) 'minimum_rating': minimumRating,
      if (queryTerm != null) 'query_term': queryTerm,
      if (genre != null) 'genre': genre,
      if (sortBy != null) 'sort_by': sortBy,
      if (orderBy != null) 'order_by': orderBy,
      if (withRtRatings != null) 'with_rt_ratings': withRtRatings,
    };
    final _options = _setStreamType<ListMoviesResponse>(
      Options(method: 'GET')
          .compose(_dio.options, '/list_movies.json',
              queryParameters: queryParameters)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ListMoviesResponse _value;
    try {
      _value = ListMoviesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ParentalGuidesResponse> getParentalGuides(String movieId) async {
    final queryParameters = <String, dynamic>{'movie_id': movieId};
    final _options = _setStreamType<ParentalGuidesResponse>(
      Options(method: 'GET')
          .compose(_dio.options, '/movie_parental_guides.json',
              queryParameters: queryParameters)
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ParentalGuidesResponse _value;
    try {
      _value = ParentalGuidesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }
    final url = Uri.parse(baseUrl);
    if (url.isAbsolute) {
      return url.toString();
    }
    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}