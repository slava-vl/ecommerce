import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../domain/models/cart_model.dart';
import '../domain/models/home_data_model.dart';
import '../domain/models/product_details.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('654bd15e-b121-49ba-a588-960956b15175')
  Future<HomeDataModel> fetchHomeData();

  @GET('6c14c560-15c6-4248-b9d2-b4508df7d4f5')
  Future<ProductDetails> fetchProductDetailData();

  @GET('53539a72-3c5f-4f30-bbb1-6ca10d42c149')
  Future<CartModel> fetchCartItems();
}
