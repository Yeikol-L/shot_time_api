//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateReservationDto {
  /// Returns a new [CreateReservationDto] instance.
  CreateReservationDto({
    required this.userId,
    required this.serviceId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  num userId;

  num serviceId;

  String date;

  DateTime startTime;

  DateTime endTime;

  CreateReservationDtoStatusEnum status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateReservationDto &&
    other.userId == userId &&
    other.serviceId == serviceId &&
    other.date == date &&
    other.startTime == startTime &&
    other.endTime == endTime &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId.hashCode) +
    (serviceId.hashCode) +
    (date.hashCode) +
    (startTime.hashCode) +
    (endTime.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'CreateReservationDto[userId=$userId, serviceId=$serviceId, date=$date, startTime=$startTime, endTime=$endTime, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'user_id'] = this.userId;
      json[r'service_id'] = this.serviceId;
      json[r'date'] = this.date;
      json[r'start_time'] = this.startTime.toUtc().toIso8601String();
      json[r'end_time'] = this.endTime.toUtc().toIso8601String();
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [CreateReservationDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateReservationDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateReservationDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateReservationDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateReservationDto(
        userId: num.parse('${json[r'user_id']}'),
        serviceId: num.parse('${json[r'service_id']}'),
        date: mapValueOfType<String>(json, r'date')!,
        startTime: mapDateTime(json, r'start_time', r'')!,
        endTime: mapDateTime(json, r'end_time', r'')!,
        status: CreateReservationDtoStatusEnum.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<CreateReservationDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateReservationDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateReservationDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateReservationDto> mapFromJson(dynamic json) {
    final map = <String, CreateReservationDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateReservationDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateReservationDto-objects as value to a dart map
  static Map<String, List<CreateReservationDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateReservationDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateReservationDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_id',
    'service_id',
    'date',
    'start_time',
    'end_time',
    'status',
  };
}


class CreateReservationDtoStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CreateReservationDtoStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pending = CreateReservationDtoStatusEnum._(r'pending');
  static const accepted = CreateReservationDtoStatusEnum._(r'accepted');
  static const rejected = CreateReservationDtoStatusEnum._(r'rejected');
  static const done = CreateReservationDtoStatusEnum._(r'done');
  static const canceled = CreateReservationDtoStatusEnum._(r'canceled');

  /// List of all possible values in this [enum][CreateReservationDtoStatusEnum].
  static const values = <CreateReservationDtoStatusEnum>[
    pending,
    accepted,
    rejected,
    done,
    canceled,
  ];

  static CreateReservationDtoStatusEnum? fromJson(dynamic value) => CreateReservationDtoStatusEnumTypeTransformer().decode(value);

  static List<CreateReservationDtoStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateReservationDtoStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateReservationDtoStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateReservationDtoStatusEnum] to String,
/// and [decode] dynamic data back to [CreateReservationDtoStatusEnum].
class CreateReservationDtoStatusEnumTypeTransformer {
  factory CreateReservationDtoStatusEnumTypeTransformer() => _instance ??= const CreateReservationDtoStatusEnumTypeTransformer._();

  const CreateReservationDtoStatusEnumTypeTransformer._();

  String encode(CreateReservationDtoStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CreateReservationDtoStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateReservationDtoStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'pending': return CreateReservationDtoStatusEnum.pending;
        case r'accepted': return CreateReservationDtoStatusEnum.accepted;
        case r'rejected': return CreateReservationDtoStatusEnum.rejected;
        case r'done': return CreateReservationDtoStatusEnum.done;
        case r'canceled': return CreateReservationDtoStatusEnum.canceled;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CreateReservationDtoStatusEnumTypeTransformer] instance.
  static CreateReservationDtoStatusEnumTypeTransformer? _instance;
}


