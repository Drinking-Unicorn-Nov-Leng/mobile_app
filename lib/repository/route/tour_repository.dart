import 'package:dio/dio.dart';
import 'package:mobile_app/domain/models/tour.dart';
import 'package:mobile_app/repository/common/parser.dart';

class RouteRepository {
  Dio client;
  Parser parser;

  RouteRepository({
    required this.client,
    required this.parser,
  });

  Future<List<Tour>> getAllRoutes() async {
    throw UnimplementedError();
  }

  Future<Tour> getRoute(String id) async {
    throw UnimplementedError();
  }

  Future<List<Tour>> createRoute(Tour route) async {
    throw UnimplementedError();
  }
}
