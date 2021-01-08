import 'package:flutter_social_media_app/src/constants/api_services_urls.dart';
import 'package:flutter_social_media_app/src/data/network/http_client.dart';
import 'package:flutter_social_media_app/src/models/login/login_response_model.dart';

class LoginRepository {
  Future<LoginResponseModel> loginRequest(payload) async {
    Map<String, dynamic> resp = await HTTPClient()
        .postJSONRequest(url: ApiServiceUrls.authSignin, data: payload);
    return LoginResponseModel.fromJson(resp);
  }
}
