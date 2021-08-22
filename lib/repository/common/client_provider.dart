import 'package:dio/dio.dart';

class ClientProvider {
  static Dio getClient() {
    final option = BaseOptions(
      baseUrl: 'http://95.142.47.217',
      connectTimeout: 5000,
    );
    final client = Dio(option);
    return client;
  }
}
