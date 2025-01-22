//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CategoryApi {
  CategoryApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /categories' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateCategoryDto] createCategoryDto (required):
  Future<Response> categoryControllerCreateCategoryWithHttpInfo(CreateCategoryDto createCategoryDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/categories';

    // ignore: prefer_final_locals
    Object? postBody = createCategoryDto;

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
  /// * [CreateCategoryDto] createCategoryDto (required):
  Future<void> categoryControllerCreateCategory(CreateCategoryDto createCategoryDto,) async {
    final response = await categoryControllerCreateCategoryWithHttpInfo(createCategoryDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /categories/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> categoryControllerDeleteCategoryWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/categories/{id}'
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
  Future<void> categoryControllerDeleteCategory(num id,) async {
    final response = await categoryControllerDeleteCategoryWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /categories/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  Future<Response> categoryControllerGetCategoryByIdWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/categories/{id}'
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
  Future<Object?> categoryControllerGetCategoryById(num id,) async {
    final response = await categoryControllerGetCategoryByIdWithHttpInfo(id,);
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

  /// Performs an HTTP 'PUT /categories/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///
  /// * [UpdateCategoryDto] updateCategoryDto (required):
  Future<Response> categoryControllerUpdateCategoryWithHttpInfo(num id, UpdateCategoryDto updateCategoryDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/categories/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateCategoryDto;

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
  /// * [UpdateCategoryDto] updateCategoryDto (required):
  Future<Object?> categoryControllerUpdateCategory(num id, UpdateCategoryDto updateCategoryDto,) async {
    final response = await categoryControllerUpdateCategoryWithHttpInfo(id, updateCategoryDto,);
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
