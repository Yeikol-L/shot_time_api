//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateRatingDto {
  /// Returns a new [CreateRatingDto] instance.
  CreateRatingDto({
    required this.userId,
    required this.serviceId,
    required this.reservationId,
    required this.comment,
    required this.response,
    this.commentDate,
    this.responseDate,
    required this.rating,
  });

  int userId;

  int serviceId;

  int reservationId;

  String comment;

  String response;

  Object? commentDate;

  Object? responseDate;

  String rating;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateRatingDto &&
    other.userId == userId &&
    other.serviceId == serviceId &&
    other.reservationId == reservationId &&
    other.comment == comment &&
    other.response == response &&
    other.commentDate == commentDate &&
    other.responseDate == responseDate &&
    other.rating == rating;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId.hashCode) +
    (serviceId.hashCode) +
    (reservationId.hashCode) +
    (comment.hashCode) +
    (response.hashCode) +
    (commentDate == null ? 0 : commentDate!.hashCode) +
    (responseDate == null ? 0 : responseDate!.hashCode) +
    (rating.hashCode);

  @override
  String toString() => 'CreateRatingDto[userId=$userId, serviceId=$serviceId, reservationId=$reservationId, comment=$comment, response=$response, commentDate=$commentDate, responseDate=$responseDate, rating=$rating]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'user_id'] = this.userId;
      json[r'service_id'] = this.serviceId;
      json[r'reservation_id'] = this.reservationId;
      json[r'comment'] = this.comment;
      json[r'response'] = this.response;
    if (this.commentDate != null) {
      json[r'commentDate'] = this.commentDate;
    } else {
      json[r'commentDate'] = null;
    }
    if (this.responseDate != null) {
      json[r'responseDate'] = this.responseDate;
    } else {
      json[r'responseDate'] = null;
    }
      json[r'rating'] = this.rating;
    return json;
  }

  /// Returns a new [CreateRatingDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateRatingDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateRatingDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateRatingDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateRatingDto(
        userId: mapValueOfType<int>(json, r'user_id')!,
        serviceId: mapValueOfType<int>(json, r'service_id')!,
        reservationId: mapValueOfType<int>(json, r'reservation_id')!,
        comment: mapValueOfType<String>(json, r'comment')!,
        response: mapValueOfType<String>(json, r'response')!,
        commentDate: mapValueOfType<Object>(json, r'commentDate'),
        responseDate: mapValueOfType<Object>(json, r'responseDate'),
        rating: mapValueOfType<String>(json, r'rating')!,
      );
    }
    return null;
  }

  static List<CreateRatingDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateRatingDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateRatingDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateRatingDto> mapFromJson(dynamic json) {
    final map = <String, CreateRatingDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateRatingDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateRatingDto-objects as value to a dart map
  static Map<String, List<CreateRatingDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateRatingDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateRatingDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'user_id',
    'service_id',
    'reservation_id',
    'comment',
    'response',
    'rating',
  };
}

