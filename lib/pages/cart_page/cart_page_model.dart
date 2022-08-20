import 'package:flutter/cupertino.dart';

import '../../domain/models/cart_model.dart';
import '../../domain/services/cart_data_service.dart';

class CartPageViewModel with ChangeNotifier {
  final CartDataSrvice cartDataSrvice;
  bool isLoading = false;

  late CartModel cart;

  CartPageViewModel({required this.cartDataSrvice}) {
    init();
  }

  Future<void> init() async {
    isLoading = true;
    notifyListeners();

    cart = await cartDataSrvice.fetchCartItems();

    isLoading = false;
    notifyListeners();
  }
}
