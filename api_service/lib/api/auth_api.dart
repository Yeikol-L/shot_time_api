//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /auth/change-password' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ChangePasswordDto] changePasswordDto (required):
  Future<Response> authControllerChangePasswordWithHttpInfo(ChangePasswordDto changePasswordDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/change-password';

    // ignore: prefer_final_locals
    Object? postBody = changePasswordDto;

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
  /// * [ChangePasswordDto] changePasswordDto (required):
  Future<void> authControllerChangePassword(ChangePasswordDto changePasswordDto,) async {
    final response = await authControllerChangePasswordWithHttpInfo(changePasswordDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /auth/forgot-password' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ForgotPasswordDto] forgotPasswordDto (required):
  Future<Response> authControllerForgotPasswordWithHttpInfo(ForgotPasswordDto forgotPasswordDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/forgot-password';

    // ignore: prefer_final_locals
    Object? postBody = forgotPasswordDto;

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
  /// * [ForgotPasswordDto] forgotPasswordDto (required):
  Future<void> authControllerForgotPassword(ForgotPasswordDto forgotPasswordDto,) async {
    final response = await authControllerForgotPasswordWithHttpInfo(forgotPasswordDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /auth/login' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [LoginDto] loginDto (required):
  Future<Response> authControllerLoginWithHttpInfo(LoginDto loginDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/login';

    // ignore: prefer_final_locals
    Object? postBody = loginDto;

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
  /// * [LoginDto] loginDto (required):
  Future<void> authControllerLogin(LoginDto loginDto,) async {
    final response = await authControllerLoginWithHttpInfo(loginDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /auth/register' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [RegisterDto] registerDto (required):
  Future<Response> authControllerRegisterWithHttpInfo(RegisterDto registerDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/register';

    // ignore: prefer_final_locals
    Object? postBody = registerDto;

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
  /// * [RegisterDto] registerDto (required):
  Future<Object?> authControllerRegister(RegisterDto registerDto,) async {
    final response = await authControllerRegisterWithHttpInfo(registerDto,);
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

  /// Performs an HTTP 'POST /auth/resend-verification-code' operation and returns the [Response].
  Future<Response> authControllerResendVerificationCodeWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/auth/resend-verification-code';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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

  Future<void> authControllerResendVerificationCode() async {
    final response = await authControllerResendVerificationCodeWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /auth/verify-change-password' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [VerifyChangePasswordDto] verifyChangePasswordDto (required):
  Future<Response> authControllerVerifyChangePasswordWithHttpInfo(VerifyChangePasswordDto verifyChangePasswordDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/verify-change-password';

    // ignore: prefer_final_locals
    Object? postBody = verifyChangePasswordDto;

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
  /// * [VerifyChangePasswordDto] verifyChangePasswordDto (required):
  Future<void> authControllerVerifyChangePassword(VerifyChangePasswordDto verifyChangePasswordDto,) async {
    final response = await authControllerVerifyChangePasswordWithHttpInfo(verifyChangePasswordDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /auth/verify-email' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [VerifyEmailDto] verifyEmailDto (required):
  Future<Response> authControllerVerifyEmailWithHttpInfo(VerifyEmailDto verifyEmailDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/verify-email';

    // ignore: prefer_final_locals
    Object? postBody = verifyEmailDto;

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
  /// * [VerifyEmailDto] verifyEmailDto (required):
  Future<void> authControllerVerifyEmail(VerifyEmailDto verifyEmailDto,) async {
    final response = await authControllerVerifyEmailWithHttpInfo(verifyEmailDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
