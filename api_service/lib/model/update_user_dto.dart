//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateUserDto {
  /// Returns a new [UpdateUserDto] instance.
  UpdateUserDto({
    this.role,
    this.name,
    this.email,
    this.passwordHash,
    this.profilePicture,
    this.businessName,
    this.businessAddress,
    this.phoneNumber,
  });

  UpdateUserDtoRoleEnum? role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? passwordHash;

  String? profilePicture;

  String? businessName;

  String? businessAddress;

  String? phoneNumber;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateUserDto &&
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
    (role == null ? 0 : role!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (passwordHash == null ? 0 : passwordHash!.hashCode) +
    (profilePicture == null ? 0 : profilePicture!.hashCode) +
    (businessName == null ? 0 : businessName!.hashCode) +
    (businessAddress == null ? 0 : businessAddress!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode);

  @override
  String toString() => 'UpdateUserDto[role=$role, name=$name, email=$email, passwordHash=$passwordHash, profilePicture=$profilePicture, businessName=$businessName, businessAddress=$businessAddress, phoneNumber=$phoneNumber]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.passwordHash != null) {
      json[r'password_hash'] = this.passwordHash;
    } else {
      json[r'password_hash'] = null;
    }
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

  /// Returns a new [UpdateUserDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateUserDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateUserDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateUserDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateUserDto(
        role: UpdateUserDtoRoleEnum.fromJson(json[r'role']),
        name: mapValueOfType<String>(json, r'name'),
        email: mapValueOfType<String>(json, r'email'),
        passwordHash: mapValueOfType<String>(json, r'password_hash'),
        profilePicture: mapValueOfType<String>(json, r'profile_picture'),
        businessName: mapValueOfType<String>(json, r'business_name'),
        businessAddress: mapValueOfType<String>(json, r'business_address'),
        phoneNumber: mapValueOfType<String>(json, r'phone_number'),
      );
    }
    return null;
  }

  static List<UpdateUserDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateUserDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateUserDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateUserDto> mapFromJson(dynamic json) {
    final map = <String, UpdateUserDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateUserDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateUserDto-objects as value to a dart map
  static Map<String, List<UpdateUserDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateUserDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateUserDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class UpdateUserDtoRoleEnum {
  /// Instantiate a new enum with the provided [value].
  const UpdateUserDtoRoleEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const client = UpdateUserDtoRoleEnum._(r'client');
  static const user = UpdateUserDtoRoleEnum._(r'user');
  static const admin = UpdateUserDtoRoleEnum._(r'admin');

  /// List of all possible values in this [enum][UpdateUserDtoRoleEnum].
  static const values = <UpdateUserDtoRoleEnum>[
    client,
    user,
    admin,
  ];

  static UpdateUserDtoRoleEnum? fromJson(dynamic value) => UpdateUserDtoRoleEnumTypeTransformer().decode(value);

  static List<UpdateUserDtoRoleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateUserDtoRoleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateUserDtoRoleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateUserDtoRoleEnum] to String,
/// and [decode] dynamic data back to [UpdateUserDtoRoleEnum].
class UpdateUserDtoRoleEnumTypeTransformer {
  factory UpdateUserDtoRoleEnumTypeTransformer() => _instance ??= const UpdateUserDtoRoleEnumTypeTransformer._();

  const UpdateUserDtoRoleEnumTypeTransformer._();

  String encode(UpdateUserDtoRoleEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UpdateUserDtoRoleEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateUserDtoRoleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'client': return UpdateUserDtoRoleEnum.client;
        case r'user': return UpdateUserDtoRoleEnum.user;
        case r'admin': return UpdateUserDtoRoleEnum.admin;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UpdateUserDtoRoleEnumTypeTransformer] instance.
  static UpdateUserDtoRoleEnumTypeTransformer? _instance;
}


