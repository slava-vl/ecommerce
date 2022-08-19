import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  final String id;
  @JsonKey(name: 'CPU')
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;
  bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  ProductDetails({
    required this.id,
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => _$ProductDetailsFromJson(json);

  Map<String, dynamic> productDetailsToJson(ProductDetails instance) => _$ProductDetailsToJson(instance);

}
