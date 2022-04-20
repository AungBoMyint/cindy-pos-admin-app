// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseItem _$$_PurchaseItemFromJson(Map<String, dynamic> json) =>
    _$_PurchaseItem(
      id: json['id'] as String,
      itemName: json['itemName'] as String,
      count: json['count'] as int,
      size: json['size'] as String,
      color: json['color'] as String,
      isOwnBrand: json['isOwnBrand'] as bool,
      priceType: json['priceType'] as String,
      price: json['price'] as int,
      originalPrice: json['originalPrice'] as int,
      isCouponInclude: json['isCouponInclude'] as bool,
    );

Map<String, dynamic> _$$_PurchaseItemToJson(_$_PurchaseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'count': instance.count,
      'size': instance.size,
      'color': instance.color,
      'isOwnBrand': instance.isOwnBrand,
      'priceType': instance.priceType,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'isCouponInclude': instance.isCouponInclude,
    };
