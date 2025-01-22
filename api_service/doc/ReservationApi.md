# openapi.api.ReservationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reservationControllerCreateReservation**](ReservationApi.md#reservationcontrollercreatereservation) | **POST** /reservations | 
[**reservationControllerDeleteReservation**](ReservationApi.md#reservationcontrollerdeletereservation) | **DELETE** /reservations/{id} | 
[**reservationControllerGetReservationById**](ReservationApi.md#reservationcontrollergetreservationbyid) | **GET** /reservations/{id} | 
[**reservationControllerUpdateReservation**](ReservationApi.md#reservationcontrollerupdatereservation) | **PUT** /reservations/{id} | 


# **reservationControllerCreateReservation**
> reservationControllerCreateReservation(createReservationDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReservationApi();
final createReservationDto = CreateReservationDto(); // CreateReservationDto | 

try {
    api_instance.reservationControllerCreateReservation(createReservationDto);
} catch (e) {
    print('Exception when calling ReservationApi->reservationControllerCreateReservation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createReservationDto** | [**CreateReservationDto**](CreateReservationDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationControllerDeleteReservation**
> reservationControllerDeleteReservation(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReservationApi();
final id = 8.14; // num | 

try {
    api_instance.reservationControllerDeleteReservation(id);
} catch (e) {
    print('Exception when calling ReservationApi->reservationControllerDeleteReservation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationControllerGetReservationById**
> Object reservationControllerGetReservationById(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReservationApi();
final id = 8.14; // num | 

try {
    final result = api_instance.reservationControllerGetReservationById(id);
    print(result);
} catch (e) {
    print('Exception when calling ReservationApi->reservationControllerGetReservationById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationControllerUpdateReservation**
> Object reservationControllerUpdateReservation(id, updateReservationDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReservationApi();
final id = 8.14; // num | 
final updateReservationDto = UpdateReservationDto(); // UpdateReservationDto | 

try {
    final result = api_instance.reservationControllerUpdateReservation(id, updateReservationDto);
    print(result);
} catch (e) {
    print('Exception when calling ReservationApi->reservationControllerUpdateReservation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 
 **updateReservationDto** | [**UpdateReservationDto**](UpdateReservationDto.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

