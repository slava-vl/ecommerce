import '../../data/api_client.dart';
import '../models/home_data_model.dart';

class HomeDataService {
  final ApiClient apiClient;
  HomeDataService({required this.apiClient});

  Future<HomeDataModel> fetchHomeData() async {
    return apiClient.fetchHomeData();
  }
}
