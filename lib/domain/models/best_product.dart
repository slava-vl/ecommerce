import 'package:json_annotation/json_annotation.dart';

part 'best_product.g.dart';

@JsonSerializable()
class BestProduct {
  final int id;
  @JsonKey(name: 'is_favorites')
  bool isFavorites;
  final String title;
  @JsonKey(name: 'price_without_discount')
  final int priceWithoutDiscount;
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  final String picture;

  BestProduct({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  factory BestProduct.fromJson(Map<String, dynamic> json) => _$BestProductFromJson(json);

  Map<String, dynamic> bestProductToJson(BestProduct instance) => _$BestProductToJson(instance);
}
