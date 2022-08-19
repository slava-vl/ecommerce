import 'package:flutter/cupertino.dart';

import '../../domain/models/product_details.dart';
import '../../domain/services/product_detail_data_service.dart';

class ProductDetailsPageViewModel with ChangeNotifier {
  final ProductDetailDataSrvice productDetailDataSrvice;
  bool isLoading = false;

  late ProductDetails data;

  ProductDetailsPageViewModel({required this.productDetailDataSrvice}) {
    init();
  }

  Future<void> init() async {
    isLoading = true;
    notifyListeners();

    data = await productDetailDataSrvice.fetchProductDetails();

    isLoading = false;
    notifyListeners();
  }

  List<String> sectionBarItems = ['Shop', 'Details', 'Features'];
  int selectedSectionBarItem = 0;

  Color? selectedColor;

  String? selectedCapacity;

  void changeSelectedSection(int index) {
    selectedSectionBarItem = index;
    notifyListeners();
  }

  void toggleLikeMode() {
    data.isFavorites = !data.isFavorites;
    notifyListeners();
  }

  void changeSelectedColor(Color color) {
    selectedColor = color;
    notifyListeners();
  }

  void changeSelectedCapacity(String capacity) {
    selectedCapacity = capacity;
    notifyListeners();
  }
}
