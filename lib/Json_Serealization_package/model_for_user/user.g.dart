// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    name: json['name'] as String,
    address: json['address'] == null
        ? null
        : UserAddress.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) {
  return UserAddress(
    city: json['city'] as String,
    geo: json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'geo': instance.geo,
    };

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    lat: json['lat'] as String,
    lng: json['lng'] as String,
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
