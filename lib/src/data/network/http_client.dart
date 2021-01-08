import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_social_media_app/src/data/store/app_utils.dart';
import 'package:flutter_social_media_app/src/models/login/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_social_media_app/src/data/store/app_store.dart';

class HTTPClient {
  static int REQUEST_TIMEOUT = 15;
  static int CONNECT_TIMEOUT = 5;

  final Duration _requestTimeout = Duration(seconds: REQUEST_TIMEOUT);

  final Duration _connectTimeout = Duration(seconds: CONNECT_TIMEOUT);

  Future<Map<String, dynamic>> postJSONRequest(
      {String url, Object data}) async {
    if (AppStore().getNetworkStatus()) {
      final String jsonRequest = json.encode(data);
      final String response = await postRequest(url: url, data: jsonRequest);
      if (response == "Unauthorized") {
        Map<String, dynamic> error = {
          'error': json.encode({'message': AppTextConstants.UN_AUTHORIZED}),
        };
        return error;
      } else {
        return json.decode(response) as Map<String, dynamic>;
      }
    } else {
      Map<String, dynamic> error = {
        'error': json.encode({'message': AppTextConstants.UNABLE_TO_CONNECT}),
      };
      return error;
    }
  }

  Future<String> postRequest({String url, String data}) async {
    final HttpClient client = HttpClient();
    try {
      client.connectionTimeout = _connectTimeout;
      final HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.headers.set('Content-type', 'application/json');

      AuthUser authDetails = AppStore().getAuthDetails();
      if (authDetails != null)
        request.headers
            .set('Authorization', 'Bearer ' + authDetails.accessToken);

      if (AppStore().getSessionCookie() != null)
        request.headers.set('Cookie', AppStore().getSessionCookie());

      request.write(data);
      final HttpClientResponse response =
          await request.close().timeout(_requestTimeout);
      storeCookie(response.headers);
      final String sResponse = await response.transform(utf8.decoder).join();
      print('HTTPClient Request> $url body> $data');
      print('HTTPClient Response> $sResponse');
      return sResponse;
    } catch (e) {
      return getError(e);
    } finally {
      client.close();
    }
  }

  String getError(e) {
    Map<String, dynamic> error = {
      'error': json.encode({'message': AppTextConstants.UNABLE_TO_CONNECT}),
    };
    return json.encode(error);
  }

  Future<Map<String, dynamic>> getJSONRequest({String url}) async {
    final String response = await getRequest(url: url);
    if (response == "Unauthorized") {
      Map<String, dynamic> error = {
        'error': json.encode({'message': AppTextConstants.UN_AUTHORIZED}),
      };
      return error;
    } else {
      return json.decode(response) as Map<String, dynamic>;
    }
  }

  Future<String> getRequest({String url}) async {
    final HttpClient client = HttpClient();

    try {
      client.connectionTimeout = _connectTimeout;
      final HttpClientRequest request = await client.getUrl(Uri.parse(url));
      request.headers.set('Content-type', 'application/json');

      AuthUser authDetails = AppStore().getAuthDetails();
      if (authDetails != null)
        request.headers
            .set('Authorization', 'Bearer ' + authDetails.accessToken);

      if (AppStore().getSessionCookie() != null)
        request.headers.set('Cookie', AppStore().getSessionCookie());
      final HttpClientResponse response =
          await request.close().timeout(_requestTimeout);
      storeCookie(response.headers);
      final String sResponse = await response.transform(utf8.decoder).join();
      // print('HTTPClient Response> $sResponse');
      return sResponse;
    } finally {
      client.close();
    }
  }

  void storeCookie(final HttpHeaders headers) {
    String output = '';
    headers.forEach(
      (String key, List<String> values) {
        if (key == 'set-cookie') {
          values.forEach(
            (String v) {
              output += ' ' + v.split(';').elementAt(0) + ';';
            },
          );
        }
      },
    );
    if (output.isEmpty) {
      return;
    }
    output = output.substring(0, output.length - 1);
    AppStore().setCookie(output);
  }

  uploadFile({String url, String path}) async {
    dynamic request = http.MultipartRequest('POST', Uri.parse(url));

    AuthUser authDetails = AppStore().getAuthDetails();
    if (authDetails != null)
      request.headers
          .addAll({'Authorization': 'Bearer ' + authDetails.accessToken});

    request.files.add(http.MultipartFile(
        'image', File(path).readAsBytes().asStream(), File(path).lengthSync(),
        filename: path.split('/').last));
    dynamic response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      Map decodeData = json.decode(respStr);
      decodeData['message'] = AppTextConstants.UPLOAD_SUCCESS;
      return decodeData;
    } else {
      return getError(AppTextConstants.UPLOAD_FAILED);
    }
  }
}
