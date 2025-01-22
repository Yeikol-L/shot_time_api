# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authControllerChangePassword**](AuthApi.md#authcontrollerchangepassword) | **POST** /auth/change-password | 
[**authControllerForgotPassword**](AuthApi.md#authcontrollerforgotpassword) | **POST** /auth/forgot-password | 
[**authControllerLogin**](AuthApi.md#authcontrollerlogin) | **POST** /auth/login | 
[**authControllerRegister**](AuthApi.md#authcontrollerregister) | **POST** /auth/register | 
[**authControllerResendVerificationCode**](AuthApi.md#authcontrollerresendverificationcode) | **POST** /auth/resend-verification-code | 
[**authControllerVerifyChangePassword**](AuthApi.md#authcontrollerverifychangepassword) | **POST** /auth/verify-change-password | 
[**authControllerVerifyEmail**](AuthApi.md#authcontrollerverifyemail) | **POST** /auth/verify-email | 


# **authControllerChangePassword**
> authControllerChangePassword(changePasswordDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final changePasswordDto = ChangePasswordDto(); // ChangePasswordDto | 

try {
    api_instance.authControllerChangePassword(changePasswordDto);
} catch (e) {
    print('Exception when calling AuthApi->authControllerChangePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePasswordDto** | [**ChangePasswordDto**](ChangePasswordDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerForgotPassword**
> authControllerForgotPassword(forgotPasswordDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final forgotPasswordDto = ForgotPasswordDto(); // ForgotPasswordDto | 

try {
    api_instance.authControllerForgotPassword(forgotPasswordDto);
} catch (e) {
    print('Exception when calling AuthApi->authControllerForgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forgotPasswordDto** | [**ForgotPasswordDto**](ForgotPasswordDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerLogin**
> authControllerLogin(loginDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final loginDto = LoginDto(); // LoginDto | 

try {
    api_instance.authControllerLogin(loginDto);
} catch (e) {
    print('Exception when calling AuthApi->authControllerLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginDto** | [**LoginDto**](LoginDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerRegister**
> Object authControllerRegister(registerDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final registerDto = RegisterDto(); // RegisterDto | 

try {
    final result = api_instance.authControllerRegister(registerDto);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->authControllerRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerDto** | [**RegisterDto**](RegisterDto.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerResendVerificationCode**
> authControllerResendVerificationCode()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();

try {
    api_instance.authControllerResendVerificationCode();
} catch (e) {
    print('Exception when calling AuthApi->authControllerResendVerificationCode: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerVerifyChangePassword**
> authControllerVerifyChangePassword(verifyChangePasswordDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthApi();
final verifyChangePasswordDto = VerifyChangePasswordDto(); // VerifyChangePasswordDto | 

try {
    api_instance.authControllerVerifyChangePassword(verifyChangePasswordDto);
} catch (e) {
    print('Exception when calling AuthApi->authControllerVerifyChangePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyChangePasswordDto** | [**VerifyChangePasswordDto**](VerifyChangePasswordDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerVerifyEmail**
> authControllerVerifyEmail(verifyEmailDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final verifyEmailDto = VerifyEmailDto(); // VerifyEmailDto | 

try {
    api_instance.authControllerVerifyEmail(verifyEmailDto);
} catch (e) {
    print('Exception when calling AuthApi->authControllerVerifyEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyEmailDto** | [**VerifyEmailDto**](VerifyEmailDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

