//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAvailabilityDto {
  /// Returns a new [CreateAvailabilityDto] instance.
  CreateAvailabilityDto({
    required this.serviceId,
    required this.day,
    required this.openingTime,
    required this.closingTime,
  });

  int serviceId;

  CreateAvailabilityDtoDayEnum day;

  String openingTime;

  String closingTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateAvailabilityDto &&
    other.serviceId == serviceId &&
    other.day == day &&
    other.openingTime == openingTime &&
    other.closingTime == closingTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (serviceId.hashCode) +
    (day.hashCode) +
    (openingTime.hashCode) +
    (closingTime.hashCode);

  @override
  String toString() => 'CreateAvailabilityDto[serviceId=$serviceId, day=$day, openingTime=$openingTime, closingTime=$closingTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'service_id'] = this.serviceId;
      json[r'day'] = this.day;
      json[r'opening_time'] = this.openingTime;
      json[r'closing_time'] = this.closingTime;
    return json;
  }

  /// Returns a new [CreateAvailabilityDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateAvailabilityDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateAvailabilityDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateAvailabilityDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateAvailabilityDto(
        serviceId: mapValueOfType<int>(json, r'service_id')!,
        day: CreateAvailabilityDtoDayEnum.fromJson(json[r'day'])!,
        openingTime: mapValueOfType<String>(json, r'opening_time')!,
        closingTime: mapValueOfType<String>(json, r'closing_time')!,
      );
    }
    return null;
  }

  static List<CreateAvailabilityDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateAvailabilityDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAvailabilityDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateAvailabilityDto> mapFromJson(dynamic json) {
    final map = <String, CreateAvailabilityDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAvailabilityDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateAvailabilityDto-objects as value to a dart map
  static Map<String, List<CreateAvailabilityDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateAvailabilityDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateAvailabilityDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'service_id',
    'day',
    'opening_time',
    'closing_time',
  };
}


class CreateAvailabilityDtoDayEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateAvailabilityDtoDayEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const monday = CreateAvailabilityDtoDayEnum._(r'monday');
  static const tuesday = CreateAvailabilityDtoDayEnum._(r'tuesday');
  static const wednesday = CreateAvailabilityDtoDayEnum._(r'wednesday');
  static const thursday = CreateAvailabilityDtoDayEnum._(r'thursday');
  static const friday = CreateAvailabilityDtoDayEnum._(r'friday');
  static const saturday = CreateAvailabilityDtoDayEnum._(r'saturday');
  static const sunday = CreateAvailabilityDtoDayEnum._(r'sunday');

  /// List of all possible values in this [enum][CreateAvailabilityDtoDayEnum].
  static const values = <CreateAvailabilityDtoDayEnum>[
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  ];

  static CreateAvailabilityDtoDayEnum? fromJson(dynamic value) => CreateAvailabilityDtoDayEnumTypeTransformer().decode(value);

  static List<CreateAvailabilityDtoDayEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateAvailabilityDtoDayEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAvailabilityDtoDayEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateAvailabilityDtoDayEnum] to String,
/// and [decode] dynamic data back to [CreateAvailabilityDtoDayEnum].
class CreateAvailabilityDtoDayEnumTypeTransformer {
  factory CreateAvailabilityDtoDayEnumTypeTransformer() => _instance ??= const CreateAvailabilityDtoDayEnumTypeTransformer._();

  const CreateAvailabilityDtoDayEnumTypeTransformer._();

  String encode(CreateAvailabilityDtoDayEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateAvailabilityDtoDayEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateAvailabilityDtoDayEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'monday': return CreateAvailabilityDtoDayEnum.monday;
        case r'tuesday': return CreateAvailabilityDtoDayEnum.tuesday;
        case r'wednesday': return CreateAvailabilityDtoDayEnum.wednesday;
        case r'thursday': return CreateAvailabilityDtoDayEnum.thursday;
        case r'friday': return CreateAvailabilityDtoDayEnum.friday;
        case r'saturday': return CreateAvailabilityDtoDayEnum.saturday;
        case r'sunday': return CreateAvailabilityDtoDayEnum.sunday;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateAvailabilityDtoDayEnumTypeTransformer] instance.
  static CreateAvailabilityDtoDayEnumTypeTransformer? _instance;
}


