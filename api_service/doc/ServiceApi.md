# openapi.api.ServiceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**serviceControllerCreateService**](ServiceApi.md#servicecontrollercreateservice) | **POST** /services | 
[**serviceControllerDeleteService**](ServiceApi.md#servicecontrollerdeleteservice) | **DELETE** /services/{id} | 
[**serviceControllerGetServiceById**](ServiceApi.md#servicecontrollergetservicebyid) | **GET** /services/{id} | 
[**serviceControllerUpdateService**](ServiceApi.md#servicecontrollerupdateservice) | **PUT** /services/{id} | 


# **serviceControllerCreateService**
> serviceControllerCreateService(createServiceDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ServiceApi();
final createServiceDto = CreateServiceDto(); // CreateServiceDto | 

try {
    api_instance.serviceControllerCreateService(createServiceDto);
} catch (e) {
    print('Exception when calling ServiceApi->serviceControllerCreateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createServiceDto** | [**CreateServiceDto**](CreateServiceDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **serviceControllerDeleteService**
> serviceControllerDeleteService(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ServiceApi();
final id = 8.14; // num | 

try {
    api_instance.serviceControllerDeleteService(id);
} catch (e) {
    print('Exception when calling ServiceApi->serviceControllerDeleteService: $e\n');
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

# **serviceControllerGetServiceById**
> Object serviceControllerGetServiceById(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ServiceApi();
final id = 8.14; // num | 

try {
    final result = api_instance.serviceControllerGetServiceById(id);
    print(result);
} catch (e) {
    print('Exception when calling ServiceApi->serviceControllerGetServiceById: $e\n');
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

# **serviceControllerUpdateService**
> Object serviceControllerUpdateService(id, updateServiceDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ServiceApi();
final id = 8.14; // num | 
final updateServiceDto = UpdateServiceDto(); // UpdateServiceDto | 

try {
    final result = api_instance.serviceControllerUpdateService(id, updateServiceDto);
    print(result);
} catch (e) {
    print('Exception when calling ServiceApi->serviceControllerUpdateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 
 **updateServiceDto** | [**UpdateServiceDto**](UpdateServiceDto.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

