// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotProduct _$HotProductFromJson(Map<String, dynamic> json) => HotProduct(
      id: json['id'] as int,
      isNew: json['is_new'] as bool? ?? false,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      picture: json['picture'] as String,
      isBuy: json['is_buy'] as bool,
    );

Map<String, dynamic> _$HotProductToJson(HotProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_new': instance.isNew,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'picture': instance.picture,
      'is_buy': instance.isBuy,
    };
