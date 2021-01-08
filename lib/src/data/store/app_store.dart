import 'package:flutter_social_media_app/src/models/common/user_model.dart';
import 'package:flutter_social_media_app/src/models/login/login_response_model.dart';

class AppStore {
  static final AppStore _appStore = AppStore._();
  factory AppStore() => _appStore;
  AppStore._() {}
  bool _networkStatus = true;
  String _sessionCookie;
  UserModel userDetails;
  AuthUser authDetails;

  String getSessionCookie() {
    return _sessionCookie;
  }

  void setCookie(String cookie) {
    _sessionCookie = cookie;
  }

  void setUserDetails(UserModel _userModel) {
    userDetails = _userModel;
  }

  void setAuthDetails(AuthUser _user) {
    authDetails = _user;
  }

  AuthUser getAuthDetails() {
    return authDetails;
  }

  UserModel getUserDetails() {
    return userDetails;
  }

  void setNetworkStatus(bool status) {
    _networkStatus = status;
  }

  bool getNetworkStatus() {
    return _networkStatus;
  }
}
