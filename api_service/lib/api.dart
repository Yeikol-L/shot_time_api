//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/availability_api.dart';
part 'api/category_api.dart';
part 'api/profile_api.dart';
part 'api/rating_api.dart';
part 'api/reservation_api.dart';
part 'api/service_api.dart';
part 'api/user_api.dart';

part 'model/change_password_dto.dart';
part 'model/create_availability_dto.dart';
part 'model/create_category_dto.dart';
part 'model/create_rating_dto.dart';
part 'model/create_reservation_dto.dart';
part 'model/create_service_dto.dart';
part 'model/create_user_dto.dart';
part 'model/forgot_password_dto.dart';
part 'model/login_dto.dart';
part 'model/register_dto.dart';
part 'model/update_availability_dto.dart';
part 'model/update_category_dto.dart';
part 'model/update_rating_dto.dart';
part 'model/update_reservation_dto.dart';
part 'model/update_service_dto.dart';
part 'model/update_user_dto.dart';
part 'model/verify_change_password_dto.dart';
part 'model/verify_email_dto.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
