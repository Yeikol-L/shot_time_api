//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VerifyChangePasswordDto {
  /// Returns a new [VerifyChangePasswordDto] instance.
  VerifyChangePasswordDto({
    required this.email,
    required this.newPassword,
    required this.code,
  });

  String email;

  String newPassword;

  num code;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VerifyChangePasswordDto &&
    other.email == email &&
    other.newPassword == newPassword &&
    other.code == code;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email.hashCode) +
    (newPassword.hashCode) +
    (code.hashCode);

  @override
  String toString() => 'VerifyChangePasswordDto[email=$email, newPassword=$newPassword, code=$code]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'email'] = this.email;
      json[r'newPassword'] = this.newPassword;
      json[r'code'] = this.code;
    return json;
  }

  /// Returns a new [VerifyChangePasswordDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VerifyChangePasswordDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VerifyChangePasswordDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VerifyChangePasswordDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VerifyChangePasswordDto(
        email: mapValueOfType<String>(json, r'email')!,
        newPassword: mapValueOfType<String>(json, r'newPassword')!,
        code: num.parse('${json[r'code']}'),
      );
    }
    return null;
  }

  static List<VerifyChangePasswordDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VerifyChangePasswordDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VerifyChangePasswordDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VerifyChangePasswordDto> mapFromJson(dynamic json) {
    final map = <String, VerifyChangePasswordDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VerifyChangePasswordDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VerifyChangePasswordDto-objects as value to a dart map
  static Map<String, List<VerifyChangePasswordDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VerifyChangePasswordDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VerifyChangePasswordDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email',
    'newPassword',
    'code',
  };
}

