//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateReservationDto {
  /// Returns a new [UpdateReservationDto] instance.
  UpdateReservationDto({
    this.userId,
    this.serviceId,
    this.date,
    this.startTime,
    this.endTime,
    this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? userId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? serviceId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? date;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? endTime;

  UpdateReservationDtoStatusEnum? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateReservationDto &&
    other.userId == userId &&
    other.serviceId == serviceId &&
    other.date == date &&
    other.startTime == startTime &&
    other.endTime == endTime &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (serviceId == null ? 0 : serviceId!.hashCode) +
    (date == null ? 0 : date!.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (endTime == null ? 0 : endTime!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'UpdateReservationDto[userId=$userId, serviceId=$serviceId, date=$date, startTime=$startTime, endTime=$endTime, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'user_id'] = this.userId;
    } else {
      json[r'user_id'] = null;
    }
    if (this.serviceId != null) {
      json[r'service_id'] = this.serviceId;
    } else {
      json[r'service_id'] = null;
    }
    if (this.date != null) {
      json[r'date'] = this.date;
    } else {
      json[r'date'] = null;
    }
    if (this.startTime != null) {
      json[r'start_time'] = this.startTime!.toUtc().toIso8601String();
    } else {
      json[r'start_time'] = null;
    }
    if (this.endTime != null) {
      json[r'end_time'] = this.endTime!.toUtc().toIso8601String();
    } else {
      json[r'end_time'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateReservationDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateReservationDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateReservationDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateReservationDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateReservationDto(
        userId: num.parse('${json[r'user_id']}'),
        serviceId: num.parse('${json[r'service_id']}'),
        date: mapValueOfType<String>(json, r'date'),
        startTime: mapDateTime(json, r'start_time', r''),
        endTime: mapDateTime(json, r'end_time', r''),
        status: UpdateReservationDtoStatusEnum.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<UpdateReservationDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateReservationDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateReservationDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateReservationDto> mapFromJson(dynamic json) {
    final map = <String, UpdateReservationDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateReservationDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateReservationDto-objects as value to a dart map
  static Map<String, List<UpdateReservationDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateReservationDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateReservationDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class UpdateReservationDtoStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const UpdateReservationDtoStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = UpdateReservationDtoStatusEnum._(r'pending');
  static const accepted = UpdateReservationDtoStatusEnum._(r'accepted');
  static const rejected = UpdateReservationDtoStatusEnum._(r'rejected');
  static const done = UpdateReservationDtoStatusEnum._(r'done');
  static const canceled = UpdateReservationDtoStatusEnum._(r'canceled');

  /// List of all possible values in this [enum][UpdateReservationDtoStatusEnum].
  static const values = <UpdateReservationDtoStatusEnum>[
    pending,
    accepted,
    rejected,
    done,
    canceled,
  ];

  static UpdateReservationDtoStatusEnum? fromJson(dynamic value) => UpdateReservationDtoStatusEnumTypeTransformer().decode(value);

  static List<UpdateReservationDtoStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateReservationDtoStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateReservationDtoStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateReservationDtoStatusEnum] to String,
/// and [decode] dynamic data back to [UpdateReservationDtoStatusEnum].
class UpdateReservationDtoStatusEnumTypeTransformer {
  factory UpdateReservationDtoStatusEnumTypeTransformer() => _instance ??= const UpdateReservationDtoStatusEnumTypeTransformer._();

  const UpdateReservationDtoStatusEnumTypeTransformer._();

  String encode(UpdateReservationDtoStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UpdateReservationDtoStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateReservationDtoStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending': return UpdateReservationDtoStatusEnum.pending;
        case r'accepted': return UpdateReservationDtoStatusEnum.accepted;
        case r'rejected': return UpdateReservationDtoStatusEnum.rejected;
        case r'done': return UpdateReservationDtoStatusEnum.done;
        case r'canceled': return UpdateReservationDtoStatusEnum.canceled;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UpdateReservationDtoStatusEnumTypeTransformer] instance.
  static UpdateReservationDtoStatusEnumTypeTransformer? _instance;
}


