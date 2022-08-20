import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'data/api_client.dart';
import 'domain/services/cart_data_service.dart';
import 'domain/services/home_data_service.dart';
import 'domain/services/product_detail_data_service.dart';

class InitializeProvider with ChangeNotifier {
  late final ApiClient _apiClient;
  ApiClient get apiClient => _apiClient;

  late final HomeDataService _homeDataService;
  HomeDataService get homeDataService => _homeDataService;

  late final ProductDetailDataSrvice _productDetailDataSrvice;
  ProductDetailDataSrvice get productDetailDataSrvice => _productDetailDataSrvice;

  late final CartDataSrvice _cartDataSrvice;
  CartDataSrvice get cartDataSrvice => _cartDataSrvice;

  Future<void> initializeApp() async {
    _apiClient = ApiClient(Dio());
    _homeDataService = HomeDataService(apiClient: _apiClient);
    _productDetailDataSrvice = ProductDetailDataSrvice(apiClient: _apiClient);
    _cartDataSrvice = CartDataSrvice(apiClient: _apiClient);
  }
}
