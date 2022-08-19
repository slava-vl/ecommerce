import 'package:json_annotation/json_annotation.dart';

import 'best_product.dart';
import 'hot_product.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  @JsonKey(name: 'home_store')
  final List<HotProduct> hotProducts;
  @JsonKey(name: 'best_seller')
  final List<BestProduct> bestProducts;

  HomeDataModel({
    required this.hotProducts,
    required this.bestProducts,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

  Map<String, dynamic> homeDataModelToJson(HomeDataModel instance) => _$HomeDataModelToJson(instance);
}
