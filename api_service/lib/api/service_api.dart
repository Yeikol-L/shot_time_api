//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ServiceApi {
  ServiceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /services' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateServiceDto] createServiceDto (required):
  Future<Response> serviceControllerCreateServiceWithHttpInfo(CreateServiceDto createServiceDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/services';

    // ignore: prefer_final_locals
    Object? postBody = createServiceDto;

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
  /// * [CreateServiceDto] createServiceDto (required):
  Future<void> serviceControllerCreateService(CreateServiceDto createServiceDto,) async {
    final response = await serviceControllerCreateServiceWithHttpInfo(createServiceDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /services/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> serviceControllerDeleteServiceWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/{id}'
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
  Future<void> serviceControllerDeleteService(num id,) async {
    final response = await serviceControllerDeleteServiceWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /services/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> serviceControllerGetServiceByIdWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/{id}'
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
  Future<Object?> serviceControllerGetServiceById(num id,) async {
    final response = await serviceControllerGetServiceByIdWithHttpInfo(id,);
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

  /// Performs an HTTP 'PUT /services/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///
  /// * [UpdateServiceDto] updateServiceDto (required):
  Future<Response> serviceControllerUpdateServiceWithHttpInfo(num id, UpdateServiceDto updateServiceDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateServiceDto;

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
  /// * [UpdateServiceDto] updateServiceDto (required):
  Future<Object?> serviceControllerUpdateService(num id, UpdateServiceDto updateServiceDto,) async {
    final response = await serviceControllerUpdateServiceWithHttpInfo(id, updateServiceDto,);
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
