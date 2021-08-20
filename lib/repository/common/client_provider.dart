import 'package:dio/dio.dart';

class ClientProvider {
  Dio getClient() {
    final option = BaseOptions(
      baseUrl: '',
      connectTimeout: 5000,
    );
    final client = Dio(option);
    return client;
  }
}
