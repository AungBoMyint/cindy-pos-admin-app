import 'package:freezed_annotation/freezed_annotation.dart';

import 'purchase_item.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  @JsonSerializable(explicitToJson: true)
  factory PurchaseModel({
    required String id,
    required List<PurchaseItem> items,
    required String name,
    required String email,
    required int phone,
    required String address,
    required String? bankSlipImage,
    required List deliveryTownshipInfo,
    required DateTime? dateTime,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}
