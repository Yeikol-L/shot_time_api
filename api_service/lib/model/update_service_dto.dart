//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateServiceDto {
  /// Returns a new [UpdateServiceDto] instance.
  UpdateServiceDto({
    this.clientId,
    this.name,
    this.description,
    this.price,
    this.categoryId,
    this.rating,
    this.serviceDuration = 30,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? clientId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? price;

  num? categoryId;

  String? rating;

  /// Minimum value: 0
  int serviceDuration;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateServiceDto &&
    other.clientId == clientId &&
    other.name == name &&
    other.description == description &&
    other.price == price &&
    other.categoryId == categoryId &&
    other.rating == rating &&
    other.serviceDuration == serviceDuration;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clientId == null ? 0 : clientId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (serviceDuration.hashCode);

  @override
  String toString() => 'UpdateServiceDto[clientId=$clientId, name=$name, description=$description, price=$price, categoryId=$categoryId, rating=$rating, serviceDuration=$serviceDuration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.clientId != null) {
      json[r'client_id'] = this.clientId;
    } else {
      json[r'client_id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.categoryId != null) {
      json[r'category_id'] = this.categoryId;
    } else {
      json[r'category_id'] = null;
    }
    if (this.rating != null) {
      json[r'rating'] = this.rating;
    } else {
      json[r'rating'] = null;
    }
      json[r'service_duration'] = this.serviceDuration;
    return json;
  }

  /// Returns a new [UpdateServiceDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateServiceDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateServiceDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateServiceDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateServiceDto(
        clientId: mapValueOfType<int>(json, r'client_id'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        price: mapValueOfType<String>(json, r'price'),
        categoryId: json[r'category_id'] == null
            ? null
            : num.parse('${json[r'category_id']}'),
        rating: mapValueOfType<String>(json, r'rating'),
        serviceDuration: mapValueOfType<int>(json, r'service_duration') ?? 30,
      );
    }
    return null;
  }

  static List<UpdateServiceDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateServiceDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateServiceDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateServiceDto> mapFromJson(dynamic json) {
    final map = <String, UpdateServiceDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateServiceDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateServiceDto-objects as value to a dart map
  static Map<String, List<UpdateServiceDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateServiceDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateServiceDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

