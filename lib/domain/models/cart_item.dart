import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  final int id;
  final String images;
  final int price;
  final String title;
  CartItem({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  Map<String, dynamic> cartItemToJson(CartItem instance) => _$CartItemToJson(instance);
}
