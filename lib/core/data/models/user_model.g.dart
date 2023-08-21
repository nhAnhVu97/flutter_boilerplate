// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserModel',
      json,
      ($checkedConvert) {
        final val = UserModel(
          id: $checkedConvert('id', (v) => v as int),
          uid: $checkedConvert('uid', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          firstName: $checkedConvert('first_name', (v) => v as String),
          lastName: $checkedConvert('last_name', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          avatar: $checkedConvert('avatar', (v) => v as String),
          gender: $checkedConvert('gender', (v) => v as String),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String),
          socialInsuranceNumber:
              $checkedConvert('social_insurance_number', (v) => v as String),
          dateOfBirth: $checkedConvert(
              'date_of_birth', (v) => DateTime.parse(v as String)),
          employment: $checkedConvert('employment',
              (v) => Employment.fromJson(v as Map<String, dynamic>)),
          address: $checkedConvert(
              'address', (v) => Address.fromJson(v as Map<String, dynamic>)),
          creditCard: $checkedConvert('credit_card',
              (v) => CreditCard.fromJson(v as Map<String, dynamic>)),
          subscription: $checkedConvert('subscription',
              (v) => Subscription.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'phoneNumber': 'phone_number',
        'socialInsuranceNumber': 'social_insurance_number',
        'dateOfBirth': 'date_of_birth',
        'creditCard': 'credit_card'
      },
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'social_insurance_number': instance.socialInsuranceNumber,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'employment': instance.employment,
      'address': instance.address,
      'credit_card': instance.creditCard,
      'subscription': instance.subscription,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Address',
      json,
      ($checkedConvert) {
        final val = Address(
          city: $checkedConvert('city', (v) => v as String),
          streetName: $checkedConvert('street_name', (v) => v as String),
          streetAddress: $checkedConvert('street_address', (v) => v as String),
          zipCode: $checkedConvert('zip_code', (v) => v as String),
          state: $checkedConvert('state', (v) => v as String),
          country: $checkedConvert('country', (v) => v as String),
          coordinates: $checkedConvert('coordinates',
              (v) => Coordinates.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'streetName': 'street_name',
        'streetAddress': 'street_address',
        'zipCode': 'zip_code'
      },
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'street_name': instance.streetName,
      'street_address': instance.streetAddress,
      'zip_code': instance.zipCode,
      'state': instance.state,
      'country': instance.country,
      'coordinates': instance.coordinates,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Coordinates',
      json,
      ($checkedConvert) {
        final val = Coordinates(
          lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
          lng: $checkedConvert('lng', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CreditCard',
      json,
      ($checkedConvert) {
        final val = CreditCard(
          ccNumber: $checkedConvert('cc_number', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'ccNumber': 'cc_number'},
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'cc_number': instance.ccNumber,
    };

Employment _$EmploymentFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Employment',
      json,
      ($checkedConvert) {
        final val = Employment(
          title: $checkedConvert('title', (v) => v as String),
          keySkill: $checkedConvert('key_skill', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'keySkill': 'key_skill'},
    );

Map<String, dynamic> _$EmploymentToJson(Employment instance) =>
    <String, dynamic>{
      'title': instance.title,
      'key_skill': instance.keySkill,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'Subscription',
      json,
      ($checkedConvert) {
        final val = Subscription(
          plan: $checkedConvert('plan', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
          paymentMethod: $checkedConvert('payment_method', (v) => v as String),
          term: $checkedConvert('term', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'paymentMethod': 'payment_method'},
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'plan': instance.plan,
      'status': instance.status,
      'payment_method': instance.paymentMethod,
      'term': instance.term,
    };
