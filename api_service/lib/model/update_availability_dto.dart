//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateAvailabilityDto {
  /// Returns a new [UpdateAvailabilityDto] instance.
  UpdateAvailabilityDto({
    this.id,
    this.serviceId,
    this.day,
    this.openingTime,
    this.closingTime,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? serviceId;

  UpdateAvailabilityDtoDayEnum? day;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? openingTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? closingTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateAvailabilityDto &&
    other.id == id &&
    other.serviceId == serviceId &&
    other.day == day &&
    other.openingTime == openingTime &&
    other.closingTime == closingTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (day == null ? 0 : day!.hashCode) +
    (openingTime == null ? 0 : openingTime!.hashCode) +
    (closingTime == null ? 0 : closingTime!.hashCode);

  @override
  String toString() => 'UpdateAvailabilityDto[id=$id, serviceId=$serviceId, day=$day, openingTime=$openingTime, closingTime=$closingTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.serviceId != null) {
      json[r'service_id'] = this.serviceId;
    } else {
      json[r'service_id'] = null;
    }
    if (this.day != null) {
      json[r'day'] = this.day;
    } else {
      json[r'day'] = null;
    }
    if (this.openingTime != null) {
      json[r'opening_time'] = this.openingTime;
    } else {
      json[r'opening_time'] = null;
    }
    if (this.closingTime != null) {
      json[r'closing_time'] = this.closingTime;
    } else {
      json[r'closing_time'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateAvailabilityDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateAvailabilityDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateAvailabilityDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateAvailabilityDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateAvailabilityDto(
        id: mapValueOfType<int>(json, r'id'),
        serviceId: mapValueOfType<int>(json, r'service_id'),
        day: UpdateAvailabilityDtoDayEnum.fromJson(json[r'day']),
        openingTime: mapValueOfType<String>(json, r'opening_time'),
        closingTime: mapValueOfType<String>(json, r'closing_time'),
      );
    }
    return null;
  }

  static List<UpdateAvailabilityDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateAvailabilityDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateAvailabilityDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateAvailabilityDto> mapFromJson(dynamic json) {
    final map = <String, UpdateAvailabilityDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateAvailabilityDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateAvailabilityDto-objects as value to a dart map
  static Map<String, List<UpdateAvailabilityDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateAvailabilityDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateAvailabilityDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class UpdateAvailabilityDtoDayEnum {
  /// Instantiate a new enum with the provided [value].
  const UpdateAvailabilityDtoDayEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const monday = UpdateAvailabilityDtoDayEnum._(r'monday');
  static const tuesday = UpdateAvailabilityDtoDayEnum._(r'tuesday');
  static const wednesday = UpdateAvailabilityDtoDayEnum._(r'wednesday');
  static const thursday = UpdateAvailabilityDtoDayEnum._(r'thursday');
  static const friday = UpdateAvailabilityDtoDayEnum._(r'friday');
  static const saturday = UpdateAvailabilityDtoDayEnum._(r'saturday');
  static const sunday = UpdateAvailabilityDtoDayEnum._(r'sunday');

  /// List of all possible values in this [enum][UpdateAvailabilityDtoDayEnum].
  static const values = <UpdateAvailabilityDtoDayEnum>[
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  ];

  static UpdateAvailabilityDtoDayEnum? fromJson(dynamic value) => UpdateAvailabilityDtoDayEnumTypeTransformer().decode(value);

  static List<UpdateAvailabilityDtoDayEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateAvailabilityDtoDayEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateAvailabilityDtoDayEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateAvailabilityDtoDayEnum] to String,
/// and [decode] dynamic data back to [UpdateAvailabilityDtoDayEnum].
class UpdateAvailabilityDtoDayEnumTypeTransformer {
  factory UpdateAvailabilityDtoDayEnumTypeTransformer() => _instance ??= const UpdateAvailabilityDtoDayEnumTypeTransformer._();

  const UpdateAvailabilityDtoDayEnumTypeTransformer._();

  String encode(UpdateAvailabilityDtoDayEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UpdateAvailabilityDtoDayEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateAvailabilityDtoDayEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'monday': return UpdateAvailabilityDtoDayEnum.monday;
        case r'tuesday': return UpdateAvailabilityDtoDayEnum.tuesday;
        case r'wednesday': return UpdateAvailabilityDtoDayEnum.wednesday;
        case r'thursday': return UpdateAvailabilityDtoDayEnum.thursday;
        case r'friday': return UpdateAvailabilityDtoDayEnum.friday;
        case r'saturday': return UpdateAvailabilityDtoDayEnum.saturday;
        case r'sunday': return UpdateAvailabilityDtoDayEnum.sunday;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UpdateAvailabilityDtoDayEnumTypeTransformer] instance.
  static UpdateAvailabilityDtoDayEnumTypeTransformer? _instance;
}


