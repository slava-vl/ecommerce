import 'package:json_annotation/json_annotation.dart';

part 'hot_product.g.dart';

@JsonSerializable()
class HotProduct {
  final int id;
  @JsonKey(name: 'is_new')
  final bool isNew;
  final String title;
  final String subtitle;
  final String picture;
  @JsonKey(name: 'is_buy')
  final bool isBuy;

  HotProduct({
    required this.id,
    this.isNew = false,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  factory HotProduct.fromJson(Map<String, dynamic> json) => _$HotProductFromJson(json);

  Map<String, dynamic> hotProductToJson(HotProduct instance) => _$HotProductToJson(instance);
}
