# openapi.api.RatingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ratingControllerCreateRating**](RatingApi.md#ratingcontrollercreaterating) | **POST** /ratings | 
[**ratingControllerDeleteRating**](RatingApi.md#ratingcontrollerdeleterating) | **DELETE** /ratings/{id} | 
[**ratingControllerGetRatingById**](RatingApi.md#ratingcontrollergetratingbyid) | **GET** /ratings/{id} | 
[**ratingControllerUpdateRating**](RatingApi.md#ratingcontrollerupdaterating) | **PUT** /ratings/{id} | 


# **ratingControllerCreateRating**
> ratingControllerCreateRating(createRatingDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RatingApi();
final createRatingDto = CreateRatingDto(); // CreateRatingDto | 

try {
    api_instance.ratingControllerCreateRating(createRatingDto);
} catch (e) {
    print('Exception when calling RatingApi->ratingControllerCreateRating: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createRatingDto** | [**CreateRatingDto**](CreateRatingDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ratingControllerDeleteRating**
> ratingControllerDeleteRating(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RatingApi();
final id = 8.14; // num | 

try {
    api_instance.ratingControllerDeleteRating(id);
} catch (e) {
    print('Exception when calling RatingApi->ratingControllerDeleteRating: $e\n');
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

# **ratingControllerGetRatingById**
> Object ratingControllerGetRatingById(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RatingApi();
final id = 8.14; // num | 

try {
    final result = api_instance.ratingControllerGetRatingById(id);
    print(result);
} catch (e) {
    print('Exception when calling RatingApi->ratingControllerGetRatingById: $e\n');
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

# **ratingControllerUpdateRating**
> Object ratingControllerUpdateRating(id, updateRatingDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = RatingApi();
final id = 8.14; // num | 
final updateRatingDto = UpdateRatingDto(); // UpdateRatingDto | 

try {
    final result = api_instance.ratingControllerUpdateRating(id, updateRatingDto);
    print(result);
} catch (e) {
    print('Exception when calling RatingApi->ratingControllerUpdateRating: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | 
 **updateRatingDto** | [**UpdateRatingDto**](UpdateRatingDto.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

