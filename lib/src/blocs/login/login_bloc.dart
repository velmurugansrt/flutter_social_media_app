import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_social_media_app/src/constants/storage_constants.dart';
import 'package:flutter_social_media_app/src/data/repository/login/login_repository.dart';
import 'package:flutter_social_media_app/src/data/store/app_storage.dart';
import 'package:flutter_social_media_app/src/data/store/app_store.dart';
import 'package:flutter_social_media_app/src/models/common/user_model.dart';
import 'package:flutter_social_media_app/src/models/login/login_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginInitialState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSignInEvent) {
      yield* _handleLoginSignInEvent(event);
    }
  }

  Stream<LoginState> _handleLoginSignInEvent(LoginSignInEvent event) async* {
    yield LoginProgressState();
    LoginResponseModel loginResponseModel =
        await LoginRepository().loginRequest(event.payload);
    if (loginResponseModel.isSuccess()) {
      Map userDetails = {
        'loginUserDetails': loginResponseModel.user.toJson(),
        'googleUserDetails': event.userDetails,
      };
      AppStore().setUserDetails(UserModel.fromJson(event.userDetails));
      AppStore().setAuthDetails(loginResponseModel.user);
      Future.wait(<Future<bool>>[
        AppStorage().setData(StorageConstants.USER_DETAILS, userDetails),
      ]);
      yield LoginSuccessState();
    } else {
      yield LoginFailedState(loginResponseModel.message);
    }
    // loginResponseModel.user;
  }
}
