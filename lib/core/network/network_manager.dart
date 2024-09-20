import 'package:dio/dio.dart';

class NetworkManager {
  final Dio _dio;

  static NetworkManager? _instance;
  static NetworkManager? get instance => _instance ??= NetworkManager._init();
  NetworkManager._init()
      : _dio = Dio(BaseOptions(baseUrl: 'YOUR_SERVICE_PATH'));

  Future<Response?> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
