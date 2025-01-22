//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateRatingDto {
  /// Returns a new [UpdateRatingDto] instance.
  UpdateRatingDto({
    this.comment,
    this.response,
    this.commentDate,
    this.responseDate,
    this.rating,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? comment;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? response;

  Object? commentDate;

  Object? responseDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rating;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateRatingDto &&
    other.comment == comment &&
    other.response == response &&
    other.commentDate == commentDate &&
    other.responseDate == responseDate &&
    other.rating == rating;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (comment == null ? 0 : comment!.hashCode) +
    (response == null ? 0 : response!.hashCode) +
    (commentDate == null ? 0 : commentDate!.hashCode) +
    (responseDate == null ? 0 : responseDate!.hashCode) +
    (rating == null ? 0 : rating!.hashCode);

  @override
  String toString() => 'UpdateRatingDto[comment=$comment, response=$response, commentDate=$commentDate, responseDate=$responseDate, rating=$rating]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
    if (this.response != null) {
      json[r'response'] = this.response;
    } else {
      json[r'response'] = null;
    }
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
    if (this.rating != null) {
      json[r'rating'] = this.rating;
    } else {
      json[r'rating'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateRatingDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateRatingDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateRatingDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateRatingDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateRatingDto(
        comment: mapValueOfType<String>(json, r'comment'),
        response: mapValueOfType<String>(json, r'response'),
        commentDate: mapValueOfType<Object>(json, r'commentDate'),
        responseDate: mapValueOfType<Object>(json, r'responseDate'),
        rating: mapValueOfType<String>(json, r'rating'),
      );
    }
    return null;
  }

  static List<UpdateRatingDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateRatingDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateRatingDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateRatingDto> mapFromJson(dynamic json) {
    final map = <String, UpdateRatingDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateRatingDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateRatingDto-objects as value to a dart map
  static Map<String, List<UpdateRatingDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateRatingDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateRatingDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

