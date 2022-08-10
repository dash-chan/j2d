// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a.json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfo _$PersonInfoFromJson(Map<String, dynamic> json) => PersonInfo(
      prefix: json['prefix'] as String,
      suffix: json['suffix'] as String,
      price: json['price'] as num,
      height: json['height'] as int,
      detail: PersonInfoDetail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonInfoToJson(PersonInfo instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'price': instance.price,
      'height': instance.height,
      'detail': instance.detail,
    };

PersonInfoDetail _$PersonInfoDetailFromJson(Map<String, dynamic> json) =>
    PersonInfoDetail(
      path: json['path'] as String,
      schema: json['schema'] as String,
    );

Map<String, dynamic> _$PersonInfoDetailToJson(PersonInfoDetail instance) =>
    <String, dynamic>{
      'path': instance.path,
      'schema': instance.schema,
    };
