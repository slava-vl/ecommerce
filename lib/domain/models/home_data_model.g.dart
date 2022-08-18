// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      hotProducts: (json['home_store'] as List<dynamic>)
          .map((e) => HotProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestProducts: (json['best_seller'] as List<dynamic>)
          .map((e) => BestProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'home_store': instance.hotProducts,
      'best_seller': instance.bestProducts,
    };
