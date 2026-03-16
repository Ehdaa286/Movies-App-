// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'home_api_client.dart';

class _HomeApiClient implements HomeApiClient {
  _HomeApiClient(
    this._dio, {
    this.baseUrl,
    // ignore: unused_element_parameter
    this.errorLogger,
  });

  final Dio _dio;
  String? baseUrl;
  final ParseErrorLogger? errorLogger;

  @override
  Future<MovieDataModel> listMovies(String? genre) async {
    final queryParameters = <String, dynamic>{
      if (genre != null) 'genre': genre,
    };
    final _options = _setStreamType<MovieDataModel>(
      Options(method: 'GET')
          .compose(
            _dio.options,
            '/list_movies.json',
            queryParameters: queryParameters,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MovieDataModel _value;
    try {
      _value = MovieDataModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MovieDataModel> searchMovies(String query) async {
    final queryParameters = <String, dynamic>{'query_term': query};
    final _options = _setStreamType<MovieDataModel>(
      Options(method: 'GET')
          .compose(
            _dio.options,
            '/list_movies.json',
            queryParameters: queryParameters,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MovieDataModel _value;
    try {
      _value = MovieDataModel.fromJson(_result.data!);
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
