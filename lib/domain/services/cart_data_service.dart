import '../../data/api_client.dart';
import '../models/cart_model.dart';

class CartDataSrvice {
  final ApiClient apiClient;
  CartDataSrvice({required this.apiClient});

  Future<CartModel> fetchCartItems() async {
    return apiClient.fetchCartItems();
  }
}
