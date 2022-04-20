// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseItem _$PurchaseItemFromJson(Map<String, dynamic> json) {
  return _PurchaseItem.fromJson(json);
}

/// @nodoc
class _$PurchaseItemTearOff {
  const _$PurchaseItemTearOff();

  _PurchaseItem call(
      {required String id,
      required String itemName,
      required int count,
      required String size,
      required String color,
      required bool isOwnBrand,
      required String priceType,
      required int price,
      required int originalPrice,
      required bool isCouponInclude}) {
    return _PurchaseItem(
      id: id,
      itemName: itemName,
      count: count,
      size: size,
      color: color,
      isOwnBrand: isOwnBrand,
      priceType: priceType,
      price: price,
      originalPrice: originalPrice,
      isCouponInclude: isCouponInclude,
    );
  }

  PurchaseItem fromJson(Map<String, Object?> json) {
    return PurchaseItem.fromJson(json);
  }
}

/// @nodoc
const $PurchaseItem = _$PurchaseItemTearOff();

/// @nodoc
mixin _$PurchaseItem {
  String get id => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  bool get isOwnBrand => throw _privateConstructorUsedError;
  String get priceType => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get originalPrice => throw _privateConstructorUsedError;
  bool get isCouponInclude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseItemCopyWith<PurchaseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseItemCopyWith<$Res> {
  factory $PurchaseItemCopyWith(
          PurchaseItem value, $Res Function(PurchaseItem) then) =
      _$PurchaseItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String itemName,
      int count,
      String size,
      String color,
      bool isOwnBrand,
      String priceType,
      int price,
      int originalPrice,
      bool isCouponInclude});
}

/// @nodoc
class _$PurchaseItemCopyWithImpl<$Res> implements $PurchaseItemCopyWith<$Res> {
  _$PurchaseItemCopyWithImpl(this._value, this._then);

  final PurchaseItem _value;
  // ignore: unused_field
  final $Res Function(PurchaseItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? itemName = freezed,
    Object? count = freezed,
    Object? size = freezed,
    Object? color = freezed,
    Object? isOwnBrand = freezed,
    Object? priceType = freezed,
    Object? price = freezed,
    Object? originalPrice = freezed,
    Object? isCouponInclude = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isOwnBrand: isOwnBrand == freezed
          ? _value.isOwnBrand
          : isOwnBrand // ignore: cast_nullable_to_non_nullable
              as bool,
      priceType: priceType == freezed
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      originalPrice: originalPrice == freezed
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      isCouponInclude: isCouponInclude == freezed
          ? _value.isCouponInclude
          : isCouponInclude // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PurchaseItemCopyWith<$Res>
    implements $PurchaseItemCopyWith<$Res> {
  factory _$PurchaseItemCopyWith(
          _PurchaseItem value, $Res Function(_PurchaseItem) then) =
      __$PurchaseItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String itemName,
      int count,
      String size,
      String color,
      bool isOwnBrand,
      String priceType,
      int price,
      int originalPrice,
      bool isCouponInclude});
}

/// @nodoc
class __$PurchaseItemCopyWithImpl<$Res> extends _$PurchaseItemCopyWithImpl<$Res>
    implements _$PurchaseItemCopyWith<$Res> {
  __$PurchaseItemCopyWithImpl(
      _PurchaseItem _value, $Res Function(_PurchaseItem) _then)
      : super(_value, (v) => _then(v as _PurchaseItem));

  @override
  _PurchaseItem get _value => super._value as _PurchaseItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? itemName = freezed,
    Object? count = freezed,
    Object? size = freezed,
    Object? color = freezed,
    Object? isOwnBrand = freezed,
    Object? priceType = freezed,
    Object? price = freezed,
    Object? originalPrice = freezed,
    Object? isCouponInclude = freezed,
  }) {
    return _then(_PurchaseItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isOwnBrand: isOwnBrand == freezed
          ? _value.isOwnBrand
          : isOwnBrand // ignore: cast_nullable_to_non_nullable
              as bool,
      priceType: priceType == freezed
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      originalPrice: originalPrice == freezed
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      isCouponInclude: isCouponInclude == freezed
          ? _value.isCouponInclude
          : isCouponInclude // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PurchaseItem implements _PurchaseItem {
  _$_PurchaseItem(
      {required this.id,
      required this.itemName,
      required this.count,
      required this.size,
      required this.color,
      required this.isOwnBrand,
      required this.priceType,
      required this.price,
      required this.originalPrice,
      required this.isCouponInclude});

  factory _$_PurchaseItem.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseItemFromJson(json);

  @override
  final String id;
  @override
  final String itemName;
  @override
  final int count;
  @override
  final String size;
  @override
  final String color;
  @override
  final bool isOwnBrand;
  @override
  final String priceType;
  @override
  final int price;
  @override
  final int originalPrice;
  @override
  final bool isCouponInclude;

  @override
  String toString() {
    return 'PurchaseItem(id: $id, itemName: $itemName, count: $count, size: $size, color: $color, isOwnBrand: $isOwnBrand, priceType: $priceType, price: $price, originalPrice: $originalPrice, isCouponInclude: $isCouponInclude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.itemName, itemName) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.isOwnBrand, isOwnBrand) &&
            const DeepCollectionEquality().equals(other.priceType, priceType) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.originalPrice, originalPrice) &&
            const DeepCollectionEquality()
                .equals(other.isCouponInclude, isCouponInclude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(itemName),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(isOwnBrand),
      const DeepCollectionEquality().hash(priceType),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(originalPrice),
      const DeepCollectionEquality().hash(isCouponInclude));

  @JsonKey(ignore: true)
  @override
  _$PurchaseItemCopyWith<_PurchaseItem> get copyWith =>
      __$PurchaseItemCopyWithImpl<_PurchaseItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseItemToJson(this);
  }
}

abstract class _PurchaseItem implements PurchaseItem {
  factory _PurchaseItem(
      {required String id,
      required String itemName,
      required int count,
      required String size,
      required String color,
      required bool isOwnBrand,
      required String priceType,
      required int price,
      required int originalPrice,
      required bool isCouponInclude}) = _$_PurchaseItem;

  factory _PurchaseItem.fromJson(Map<String, dynamic> json) =
      _$_PurchaseItem.fromJson;

  @override
  String get id;
  @override
  String get itemName;
  @override
  int get count;
  @override
  String get size;
  @override
  String get color;
  @override
  bool get isOwnBrand;
  @override
  String get priceType;
  @override
  int get price;
  @override
  int get originalPrice;
  @override
  bool get isCouponInclude;
  @override
  @JsonKey(ignore: true)
  _$PurchaseItemCopyWith<_PurchaseItem> get copyWith =>
      throw _privateConstructorUsedError;
}
