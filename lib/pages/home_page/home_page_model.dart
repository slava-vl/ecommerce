import 'package:flutter/cupertino.dart';

import '../../domain/models/home_data_model.dart';
import '../../domain/models/product_category.dart';
import '../../domain/services/home_data_service.dart';

class HomePageViewModel with ChangeNotifier {
  final HomeDataService homeDataService;

  late final HomeDataModel data;

  HomePageViewModel({required this.homeDataService});

  Future<void> init() async {
    data = await homeDataService.fetchHomeData();
  }

  List<ProductCategory> get categories => _categories;

  int _selectedCategoryId = _categories[0].id;
  int get selectedCategoryId => _selectedCategoryId;

  int _selectedHotProduct = 0;
  int get selectedHotProduct => _selectedHotProduct;

  void changeSelectedHotProduct(int index) {
    _selectedHotProduct = index%data.hotProducts.length;
    notifyListeners();
  }

  void changeSelectedCategoryId(int id) {
    _selectedCategoryId = id;
    notifyListeners();
  }
}

final List<ProductCategory> _categories = [
  ProductCategory(id: 1, title: 'Phones', ico: 'assets/phones.svg'),
  ProductCategory(id: 2, title: 'Computer', ico: 'assets/computer.svg'),
  ProductCategory(id: 3, title: 'Health', ico: 'assets/health.svg'),
  ProductCategory(id: 4, title: 'Books', ico: 'assets/books.svg'),
  ProductCategory(id: 5, title: 'Other', ico: 'assets/phones.svg'),
];
