//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateUserDto {
  /// Returns a new [CreateUserDto] instance.
  CreateUserDto({
    required this.role,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.profilePicture,
    required this.businessName,
    required this.businessAddress,
    required this.phoneNumber,
  });

  CreateUserDtoRoleEnum role;

  String name;

  String email;

  String passwordHash;

  String? profilePicture;

  String? businessName;

  String? businessAddress;

  String? phoneNumber;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateUserDto &&
    other.role == role &&
    other.name == name &&
    other.email == email &&
    other.passwordHash == passwordHash &&
    other.profilePicture == profilePicture &&
    other.businessName == businessName &&
    other.businessAddress == businessAddress &&
    other.phoneNumber == phoneNumber;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (role.hashCode) +
    (name.hashCode) +
    (email.hashCode) +
    (passwordHash.hashCode) +
    (profilePicture == null ? 0 : profilePicture!.hashCode) +
    (businessName == null ? 0 : businessName!.hashCode) +
    (businessAddress == null ? 0 : businessAddress!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode);

  @override
  String toString() => 'CreateUserDto[role=$role, name=$name, email=$email, passwordHash=$passwordHash, profilePicture=$profilePicture, businessName=$businessName, businessAddress=$businessAddress, phoneNumber=$phoneNumber]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'role'] = this.role;
      json[r'name'] = this.name;
      json[r'email'] = this.email;
      json[r'password_hash'] = this.passwordHash;
    if (this.profilePicture != null) {
      json[r'profile_picture'] = this.profilePicture;
    } else {
      json[r'profile_picture'] = null;
    }
    if (this.businessName != null) {
      json[r'business_name'] = this.businessName;
    } else {
      json[r'business_name'] = null;
    }
    if (this.businessAddress != null) {
      json[r'business_address'] = this.businessAddress;
    } else {
      json[r'business_address'] = null;
    }
    if (this.phoneNumber != null) {
      json[r'phone_number'] = this.phoneNumber;
    } else {
      json[r'phone_number'] = null;
    }
    return json;
  }

  /// Returns a new [CreateUserDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateUserDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateUserDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateUserDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateUserDto(
        role: CreateUserDtoRoleEnum.fromJson(json[r'role'])!,
        name: mapValueOfType<String>(json, r'name')!,
        email: mapValueOfType<String>(json, r'email')!,
        passwordHash: mapValueOfType<String>(json, r'password_hash')!,
        profilePicture: mapValueOfType<String>(json, r'profile_picture'),
        businessName: mapValueOfType<String>(json, r'business_name'),
        businessAddress: mapValueOfType<String>(json, r'business_address'),
        phoneNumber: mapValueOfType<String>(json, r'phone_number'),
      );
    }
    return null;
  }

  static List<CreateUserDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateUserDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateUserDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateUserDto> mapFromJson(dynamic json) {
    final map = <String, CreateUserDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateUserDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateUserDto-objects as value to a dart map
  static Map<String, List<CreateUserDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateUserDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateUserDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'role',
    'name',
    'email',
    'password_hash',
    'profile_picture',
    'business_name',
    'business_address',
    'phone_number',
  };
}


class CreateUserDtoRoleEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateUserDtoRoleEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const client = CreateUserDtoRoleEnum._(r'client');
  static const user = CreateUserDtoRoleEnum._(r'user');
  static const admin = CreateUserDtoRoleEnum._(r'admin');

  /// List of all possible values in this [enum][CreateUserDtoRoleEnum].
  static const values = <CreateUserDtoRoleEnum>[
    client,
    user,
    admin,
  ];

  static CreateUserDtoRoleEnum? fromJson(dynamic value) => CreateUserDtoRoleEnumTypeTransformer().decode(value);

  static List<CreateUserDtoRoleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateUserDtoRoleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateUserDtoRoleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateUserDtoRoleEnum] to String,
/// and [decode] dynamic data back to [CreateUserDtoRoleEnum].
class CreateUserDtoRoleEnumTypeTransformer {
  factory CreateUserDtoRoleEnumTypeTransformer() => _instance ??= const CreateUserDtoRoleEnumTypeTransformer._();

  const CreateUserDtoRoleEnumTypeTransformer._();

  String encode(CreateUserDtoRoleEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateUserDtoRoleEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateUserDtoRoleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'client': return CreateUserDtoRoleEnum.client;
        case r'user': return CreateUserDtoRoleEnum.user;
        case r'admin': return CreateUserDtoRoleEnum.admin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateUserDtoRoleEnumTypeTransformer] instance.
  static CreateUserDtoRoleEnumTypeTransformer? _instance;
}


