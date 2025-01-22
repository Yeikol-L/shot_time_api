# openapi.api.AvailabilityApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**availabilityControllerCreateAvailability**](AvailabilityApi.md#availabilitycontrollercreateavailability) | **POST** /avalability | 
[**availabilityControllerDeleteAvailability**](AvailabilityApi.md#availabilitycontrollerdeleteavailability) | **DELETE** /avalability/{id} | 
[**availabilityControllerGetAvailabilityById**](AvailabilityApi.md#availabilitycontrollergetavailabilitybyid) | **GET** /avalability/{id} | 
[**availabilityControllerUpdateAvailabilityById**](AvailabilityApi.md#availabilitycontrollerupdateavailabilitybyid) | **PUT** /avalability/{id} | 


# **availabilityControllerCreateAvailability**
> availabilityControllerCreateAvailability(createAvailabilityDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AvailabilityApi();
final createAvailabilityDto = CreateAvailabilityDto(); // CreateAvailabilityDto | 

try {
    api_instance.availabilityControllerCreateAvailability(createAvailabilityDto);
} catch (e) {
    print('Exception when calling AvailabilityApi->availabilityControllerCreateAvailability: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAvailabilityDto** | [**CreateAvailabilityDto**](CreateAvailabilityDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **availabilityControllerDeleteAvailability**
> availabilityControllerDeleteAvailability(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AvailabilityApi();
final id = 8.14; // num | 

try {
    api_instance.availabilityControllerDeleteAvailability(id);
} catch (e) {
    print('Exception when calling AvailabilityApi->availabilityControllerDeleteAvailability: $e\n');
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

# **availabilityControllerGetAvailabilityById**
> Object availabilityControllerGetAvailabilityById(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AvailabilityApi();
final id = 8.14; // num | 

try {
    final result = api_instance.availabilityControllerGetAvailabilityById(id);
    print(result);
} catch (e) {
    print('Exception when calling AvailabilityApi->availabilityControllerGetAvailabilityById: $e\n');
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

# **availabilityControllerUpdateAvailabilityById**
> Object availabilityControllerUpdateAvailabilityById(id, updateAvailabilityDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AvailabilityApi();
final id = 8.14; // num | 
final updateAvailabilityDto = UpdateAvailabilityDto(); // UpdateAvailabilityDto | 

try {
    final result = api_instance.availabilityControllerUpdateAvailabilityById(id, updateAvailabilityDto);
    print(result);
} catch (e) {
    print('Exception when calling AvailabilityApi->availabilityControllerUpdateAvailabilityById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 
 **updateAvailabilityDto** | [**UpdateAvailabilityDto**](UpdateAvailabilityDto.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

