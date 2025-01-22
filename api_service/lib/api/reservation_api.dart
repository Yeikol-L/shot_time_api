//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ReservationApi {
  ReservationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /reservations' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateReservationDto] createReservationDto (required):
  Future<Response> reservationControllerCreateReservationWithHttpInfo(CreateReservationDto createReservationDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/reservations';

    // ignore: prefer_final_locals
    Object? postBody = createReservationDto;

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
  /// * [CreateReservationDto] createReservationDto (required):
  Future<void> reservationControllerCreateReservation(CreateReservationDto createReservationDto,) async {
    final response = await reservationControllerCreateReservationWithHttpInfo(createReservationDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /reservations/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> reservationControllerDeleteReservationWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/reservations/{id}'
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
  Future<void> reservationControllerDeleteReservation(num id,) async {
    final response = await reservationControllerDeleteReservationWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /reservations/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> reservationControllerGetReservationByIdWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/reservations/{id}'
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
  Future<Object?> reservationControllerGetReservationById(num id,) async {
    final response = await reservationControllerGetReservationByIdWithHttpInfo(id,);
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

  /// Performs an HTTP 'PUT /reservations/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///
  /// * [UpdateReservationDto] updateReservationDto (required):
  Future<Response> reservationControllerUpdateReservationWithHttpInfo(num id, UpdateReservationDto updateReservationDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/reservations/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateReservationDto;

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
  /// * [UpdateReservationDto] updateReservationDto (required):
  Future<Object?> reservationControllerUpdateReservation(num id, UpdateReservationDto updateReservationDto,) async {
    final response = await reservationControllerUpdateReservationWithHttpInfo(id, updateReservationDto,);
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
