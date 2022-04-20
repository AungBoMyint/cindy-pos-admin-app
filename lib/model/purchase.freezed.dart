// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
class _$PurchaseModelTearOff {
  const _$PurchaseModelTearOff();

  _PurchaseModel call(
      {required String id,
      required List<PurchaseItem> items,
      required String name,
      required String email,
      required int phone,
      required String address,
      required String? bankSlipImage,
      required List<dynamic> deliveryTownshipInfo,
      required DateTime? dateTime}) {
    return _PurchaseModel(
      id: id,
      items: items,
      name: name,
      email: email,
      phone: phone,
      address: address,
      bankSlipImage: bankSlipImage,
      deliveryTownshipInfo: deliveryTownshipInfo,
      dateTime: dateTime,
    );
  }

  PurchaseModel fromJson(Map<String, Object?> json) {
    return PurchaseModel.fromJson(json);
  }
}

/// @nodoc
const $PurchaseModel = _$PurchaseModelTearOff();

/// @nodoc
mixin _$PurchaseModel {
  String get id => throw _privateConstructorUsedError;
  List<PurchaseItem> get items => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get bankSlipImage => throw _privateConstructorUsedError;
  List<dynamic> get deliveryTownshipInfo => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseModelCopyWith<PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<PurchaseItem> items,
      String name,
      String email,
      int phone,
      String address,
      String? bankSlipImage,
      List<dynamic> deliveryTownshipInfo,
      DateTime? dateTime});
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  final PurchaseModel _value;
  // ignore: unused_field
  final $Res Function(PurchaseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? items = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? bankSlipImage = freezed,
    Object? deliveryTownshipInfo = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItem>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bankSlipImage: bankSlipImage == freezed
          ? _value.bankSlipImage
          : bankSlipImage // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTownshipInfo: deliveryTownshipInfo == freezed
          ? _value.deliveryTownshipInfo
          : deliveryTownshipInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$PurchaseModelCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$PurchaseModelCopyWith(
          _PurchaseModel value, $Res Function(_PurchaseModel) then) =
      __$PurchaseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<PurchaseItem> items,
      String name,
      String email,
      int phone,
      String address,
      String? bankSlipImage,
      List<dynamic> deliveryTownshipInfo,
      DateTime? dateTime});
}

/// @nodoc
class __$PurchaseModelCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res>
    implements _$PurchaseModelCopyWith<$Res> {
  __$PurchaseModelCopyWithImpl(
      _PurchaseModel _value, $Res Function(_PurchaseModel) _then)
      : super(_value, (v) => _then(v as _PurchaseModel));

  @override
  _PurchaseModel get _value => super._value as _PurchaseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? items = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? bankSlipImage = freezed,
    Object? deliveryTownshipInfo = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_PurchaseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItem>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bankSlipImage: bankSlipImage == freezed
          ? _value.bankSlipImage
          : bankSlipImage // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryTownshipInfo: deliveryTownshipInfo == freezed
          ? _value.deliveryTownshipInfo
          : deliveryTownshipInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PurchaseModel implements _PurchaseModel {
  _$_PurchaseModel(
      {required this.id,
      required this.items,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.bankSlipImage,
      required this.deliveryTownshipInfo,
      required this.dateTime});

  factory _$_PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseModelFromJson(json);

  @override
  final String id;
  @override
  final List<PurchaseItem> items;
  @override
  final String name;
  @override
  final String email;
  @override
  final int phone;
  @override
  final String address;
  @override
  final String? bankSlipImage;
  @override
  final List<dynamic> deliveryTownshipInfo;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, items: $items, name: $name, email: $email, phone: $phone, address: $address, bankSlipImage: $bankSlipImage, deliveryTownshipInfo: $deliveryTownshipInfo, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.bankSlipImage, bankSlipImage) &&
            const DeepCollectionEquality()
                .equals(other.deliveryTownshipInfo, deliveryTownshipInfo) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(bankSlipImage),
      const DeepCollectionEquality().hash(deliveryTownshipInfo),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$PurchaseModelCopyWith<_PurchaseModel> get copyWith =>
      __$PurchaseModelCopyWithImpl<_PurchaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseModelToJson(this);
  }
}

abstract class _PurchaseModel implements PurchaseModel {
  factory _PurchaseModel(
      {required String id,
      required List<PurchaseItem> items,
      required String name,
      required String email,
      required int phone,
      required String address,
      required String? bankSlipImage,
      required List<dynamic> deliveryTownshipInfo,
      required DateTime? dateTime}) = _$_PurchaseModel;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$_PurchaseModel.fromJson;

  @override
  String get id;
  @override
  List<PurchaseItem> get items;
  @override
  String get name;
  @override
  String get email;
  @override
  int get phone;
  @override
  String get address;
  @override
  String? get bankSlipImage;
  @override
  List<dynamic> get deliveryTownshipInfo;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$PurchaseModelCopyWith<_PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
