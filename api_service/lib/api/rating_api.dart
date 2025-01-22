//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class RatingApi {
  RatingApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /ratings' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateRatingDto] createRatingDto (required):
  Future<Response> ratingControllerCreateRatingWithHttpInfo(CreateRatingDto createRatingDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/ratings';

    // ignore: prefer_final_locals
    Object? postBody = createRatingDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CreateRatingDto] createRatingDto (required):
  Future<void> ratingControllerCreateRating(CreateRatingDto createRatingDto,) async {
    final response = await ratingControllerCreateRatingWithHttpInfo(createRatingDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /ratings/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> ratingControllerDeleteRatingWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/ratings/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [num] id (required):
  Future<void> ratingControllerDeleteRating(num id,) async {
    final response = await ratingControllerDeleteRatingWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /ratings/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> ratingControllerGetRatingByIdWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/ratings/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Object?> ratingControllerGetRatingById(num id,) async {
    final response = await ratingControllerGetRatingByIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /ratings/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///
  /// * [UpdateRatingDto] updateRatingDto (required):
  Future<Response> ratingControllerUpdateRatingWithHttpInfo(num id, UpdateRatingDto updateRatingDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/ratings/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateRatingDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [num] id (required):
  ///
  /// * [UpdateRatingDto] updateRatingDto (required):
  Future<Object?> ratingControllerUpdateRating(num id, UpdateRatingDto updateRatingDto,) async {
    final response = await ratingControllerUpdateRatingWithHttpInfo(id, updateRatingDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }
}
