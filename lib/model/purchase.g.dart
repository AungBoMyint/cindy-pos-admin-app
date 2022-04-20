// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseModel _$$_PurchaseModelFromJson(Map<String, dynamic> json) =>
    _$_PurchaseModel(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PurchaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as int,
      address: json['address'] as String,
      bankSlipImage: json['bankSlipImage'] as String?,
      deliveryTownshipInfo: json['deliveryTownshipInfo'] as List<dynamic>,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_PurchaseModelToJson(_$_PurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'bankSlipImage': instance.bankSlipImage,
      'deliveryTownshipInfo': instance.deliveryTownshipInfo,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
