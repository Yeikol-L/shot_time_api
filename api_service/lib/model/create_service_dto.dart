//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateServiceDto {
  /// Returns a new [CreateServiceDto] instance.
  CreateServiceDto({
    required this.clientId,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.rating,
    this.serviceDuration = 30,
  });

  int clientId;

  String name;

  String? description;

  String price;

  num? categoryId;

  String? rating;

  /// Minimum value: 0
  int serviceDuration;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateServiceDto &&
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
    (clientId.hashCode) +
    (name.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (price.hashCode) +
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (serviceDuration.hashCode);

  @override
  String toString() => 'CreateServiceDto[clientId=$clientId, name=$name, description=$description, price=$price, categoryId=$categoryId, rating=$rating, serviceDuration=$serviceDuration]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'client_id'] = this.clientId;
      json[r'name'] = this.name;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'price'] = this.price;
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

  /// Returns a new [CreateServiceDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateServiceDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateServiceDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateServiceDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateServiceDto(
        clientId: mapValueOfType<int>(json, r'client_id')!,
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description'),
        price: mapValueOfType<String>(json, r'price')!,
        categoryId: json[r'category_id'] == null
            ? null
            : num.parse('${json[r'category_id']}'),
        rating: mapValueOfType<String>(json, r'rating'),
        serviceDuration: mapValueOfType<int>(json, r'service_duration') ?? 30,
      );
    }
    return null;
  }

  static List<CreateServiceDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateServiceDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateServiceDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateServiceDto> mapFromJson(dynamic json) {
    final map = <String, CreateServiceDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateServiceDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateServiceDto-objects as value to a dart map
  static Map<String, List<CreateServiceDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateServiceDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateServiceDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'client_id',
    'name',
    'description',
    'price',
    'category_id',
    'rating',
  };
}

