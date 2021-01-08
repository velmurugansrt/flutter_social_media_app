import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/src/assets/theme/app_themes.dart';
import 'package:flutter_social_media_app/src/assets/theme/theme_bloc.dart';
import 'package:flutter_social_media_app/src/blocs/home/home_bloc.dart';
import 'package:flutter_social_media_app/src/blocs/login/login_bloc.dart';
import 'package:flutter_social_media_app/src/ui/home/home_screen.dart';
import 'package:flutter_social_media_app/src/ui/navigation/screen_routes.dart';
import 'package:flutter_social_media_app/src/ui/screen/login/login_screen.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) => ThemeBloc(),
      child: AppRoutes(),
    );
  }
}

class AppRoutes extends StatefulWidget {
  AppRoutes({Key key}) : super(key: key);

  @override
  _AppRoutesState createState() => _AppRoutesState();
}

class _AppRoutesState extends State<AppRoutes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return GestureDetector(
          onTap: keyboardFocusOut,
          child: MaterialApp(
            initialRoute: ScreenRoutes.LOGIN_SCREEN,
            theme: AppTheme.themeManager(state.themeType),
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}

void keyboardFocusOut() {
  // Keyboard focus out and tab outside the input field
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}

// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ScreenRoutes.LOGIN_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.LOGIN_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
            child: LoginScreen(),
          );
        },
      );
      break;

    case ScreenRoutes.HOME_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.HOME_SCREEN),
        builder: (BuildContext context) {
          return BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(),
            child: HomeScreen(),
          );
        },
      );
      break;
    case ScreenRoutes.LOGIN_SCREEN:
      return MaterialPageRoute<dynamic>(
        settings: const RouteSettings(name: ScreenRoutes.LOGIN_SCREEN),
        builder: (BuildContext context) {
          return LoginScreen();
        },
      );
      break;
  }
}
