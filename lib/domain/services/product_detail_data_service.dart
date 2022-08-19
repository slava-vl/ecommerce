import '../../data/api_client.dart';
import '../models/product_details.dart';

class ProductDetailDataSrvice{
  final ApiClient apiClient;
  ProductDetailDataSrvice({required this.apiClient});

  Future<ProductDetails> fetchProductDetails() async {
    return apiClient.fetchProductDetailData();
  }

}