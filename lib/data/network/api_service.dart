import 'dart:convert';

import 'package:drico_chat/constants/resources.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../exceptions/network_exception.dart';

@lazySingleton
class ApiClient {
  final Client _client;
  ApiClient(this._client);

  dynamic get({
    required String path,
    Map<dynamic, dynamic>? params,
    required String auth,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth',
    };

    final response = await _client.get(getPath(path, params), headers: headers);
    if (response.statusCode == 200) {
      return _response(response);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post({
    required String path,
    Map<dynamic, dynamic>? params,
    Map<dynamic, dynamic>? body,
    required String auth,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    };

    final response =
        await _client.post(getPath(path, params), headers: headers, body: body);
    print("*****");
    print(response);
    if (response.statusCode == 200) {
      return _response(response);
    } else {
      print(response.body);
      throw Exception(response.body);
    }
  }

  dynamic delete({
    required String path,
    Map<dynamic, dynamic>? params,
    Map<dynamic, dynamic>? body,
    required String auth,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $auth'
    };

    final response = await _client.delete(getPath(path, params),
        headers: headers, body: body);
    if (response.statusCode == 200) {
      return _response(response);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${Resources.strings.apis.baseURL}$path?$paramsString');
  }

  dynamic _response(response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
