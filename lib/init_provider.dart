import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'data/api_client.dart';
import 'domain/services/home_data_service.dart';

class InitializeProvider with ChangeNotifier {
  late final ApiClient _apiClient;
  ApiClient get apiClient => _apiClient;

  late final HomeDataService _homeDataService;
  HomeDataService get homeDataService => _homeDataService;

  Future<void> initializeApp() async {
    _apiClient = ApiClient(Dio());
    _homeDataService = HomeDataService(apiClient: _apiClient);
  }
}
