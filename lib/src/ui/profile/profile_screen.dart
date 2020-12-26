import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_social_media_app/src/data/firebase/app_firebase.dart';
import 'package:flutter_social_media_app/src/data/store/app_store.dart';
import 'package:flutter_social_media_app/src/ui/navigation/screen_routes.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppWidgetSize.dimen_24,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image(
                      image: NetworkImage(
                        AppStore().getUserDetails().photoURL,
                      ),
                    ),
                  ),
                ),
                Text(
                  AppStore().getUserDetails().displayName,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppWidgetSize.buttonBorderRadius,
          ),
          onPressed: _logoutButtonPressed,
          padding: EdgeInsets.symmetric(
            vertical: AppWidgetSize.dimen_12,
            horizontal: AppWidgetSize.dimen_32,
          ),
          child: Text(
            AppTextConstants.LOGOUT,
            style: Theme.of(context).accentTextTheme.headline4,
          ),
        )
      ],
    );
  }

  _logoutButtonPressed() {
    AppFirebase().signOutGoogle();
    Navigator.of(context).pushReplacementNamed(ScreenRoutes.LOGIN_SCREEN);
  }
}
