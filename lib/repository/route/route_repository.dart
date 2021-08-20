import 'package:dio/dio.dart';
import 'package:mobile_app/domain/models/route.dart';
import 'package:mobile_app/repository/common/parser.dart';

class RouteRepository {
  Dio client;
  Parser parser;

  RouteRepository({
    required this.client,
    required this.parser,
  });

  Future<List<Route>> getAllRoutes() async {
    throw UnimplementedError();
  }

  Future<Route> getRoute(String id) async {
    throw UnimplementedError();
  }

  Future<List<Route>> createRoute(Route route) async {
    throw UnimplementedError();
  }
}
