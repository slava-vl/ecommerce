import 'package:json_annotation/json_annotation.dart';

import 'cart_item.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final List<CartItem> basket;
  final String delivery;
  final String id;
  final int total;
  CartModel({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> cartModelToJson(CartModel instance) => _$CartModelToJson(instance);
}
