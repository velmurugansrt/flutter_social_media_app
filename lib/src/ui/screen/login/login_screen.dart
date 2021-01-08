import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/app_images.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';
import 'package:flutter_social_media_app/src/blocs/login/login_bloc.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_social_media_app/src/constants/storage_constants.dart';
import 'package:flutter_social_media_app/src/data/firebase/app_firebase.dart';
import 'package:flutter_social_media_app/src/data/store/app_storage.dart';
import 'package:flutter_social_media_app/src/data/store/app_store.dart';
import 'package:flutter_social_media_app/src/models/common/user_model.dart';
import 'package:flutter_social_media_app/src/models/login/login_response_model.dart';
import 'package:flutter_social_media_app/src/ui/navigation/screen_routes.dart';
import 'package:flutter_social_media_app/src/ui/screen/base/base_screen.dart';

class LoginScreen extends BaseScreen {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen> {
  LoginBloc loginBloc;

  @override
  void initState() {
    checkAuth();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.listen(loginBlocListener);
    super.initState();
  }

  void loginBlocListener(state) {
    if (state is LoginProgressState) {
      startLoader();
    } else {
      stopLoader();
    }
    if (state is LoginSuccessState) {
      navigateToHome();
    }
  }

  void checkAuth() async {
    Map<String, dynamic> userDetails =
        await AppStorage().getData(StorageConstants.USER_DETAILS);
    if (userDetails != null) {
      AppStore()
          .setUserDetails(UserModel.fromJson(userDetails['googleUserDetails']));
      AppStore()
          .setAuthDetails(AuthUser.fromJson(userDetails['loginUserDetails']));
      navigateToHome();
    }
  }

  navigateToHome() async {
    Navigator.of(context).pushReplacementNamed(ScreenRoutes.HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _googleAuthPressed() async {
    User data = await AppFirebase().signInWithGoogle();
    if (data != null) {
      Map<String, String> userDetails = {
        'displayName': data.displayName,
        'email': data.email,
        'photoURL': data.photoURL,
        'uid': data.uid,
      };
      Map<String, String> payload = {
        'email': 'user1@gmail.com',
        'password': '123456'
      };
      loginBloc.add(LoginSignInEvent(payload, userDetails));
    }
  }

  Column _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImages.appLogo,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidgetSize.dimen_40,
                  vertical: AppWidgetSize.dimen_40,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    Text(
                      '      ' + AppTextConstants.LOGIN_WITH_GOOGLE + '      ',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidgetSize.dimen_40,
                ),
                child: RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  padding: EdgeInsets.symmetric(
                    vertical: AppWidgetSize.dimen_12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppWidgetSize.buttonBorderRadius,
                  ),
                  onPressed: _googleAuthPressed,
                  child: Row(
                    children: [
                      Expanded(
                        child: AppImages.googleLogo,
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(
                          AppTextConstants.GOOGLE,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        flex: 6,
                      ),
                      Expanded(child: Container(), flex: 2)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppWidgetSize.dimen_30),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              AppTextConstants.TERMS_CONDITIONS,
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          ),
        )
      ],
    );
  }
}
