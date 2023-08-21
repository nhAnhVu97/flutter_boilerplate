import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  UserModel({
    required this.id,
    required this.uid,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.phoneNumber,
    required this.socialInsuranceNumber,
    required this.dateOfBirth,
    required this.employment,
    required this.address,
    required this.creditCard,
    required this.subscription,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  final int id;
  final String uid;
  final String password;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String avatar;
  final String gender;
  final String phoneNumber;
  final String socialInsuranceNumber;
  final DateTime dateOfBirth;
  final Employment employment;
  final Address address;
  final CreditCard creditCard;
  final Subscription subscription;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Address {
  Address({
    required this.city,
    required this.streetName,
    required this.streetAddress,
    required this.zipCode,
    required this.state,
    required this.country,
    required this.coordinates,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  final String city;
  final String streetName;
  final String streetAddress;
  final String zipCode;
  final String state;
  final String country;
  final Coordinates coordinates;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CreditCard {
  CreditCard({
    required this.ccNumber,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) => _$CreditCardFromJson(json);
  Map<String, dynamic> toJson() => _$CreditCardToJson(this);

  final String ccNumber;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Employment {
  Employment({
    required this.title,
    required this.keySkill,
  });

  factory Employment.fromJson(Map<String, dynamic> json) => _$EmploymentFromJson(json);
  Map<String, dynamic> toJson() => _$EmploymentToJson(this);

  final String title;
  final String keySkill;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Subscription {
  Subscription({
    required this.plan,
    required this.status,
    required this.paymentMethod,
    required this.term,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  final String plan;
  final String status;
  final String paymentMethod;
  final String term;
}
