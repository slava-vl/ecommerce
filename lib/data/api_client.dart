import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../domain/models/home_data_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('654bd15e-b121-49ba-a588-960956b15175')
  Future<HomeDataModel> fetchHomeData();
}
