import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';

Widget commonBodyWidget(Widget bodyWidget, BuildContext context) {
  return Container(
    color: Theme.of(context).primaryColor,
    child: Container(
      padding: EdgeInsets.only(
        left: AppWidgetSize.bodyPadding,
        right: AppWidgetSize.bodyPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            AppWidgetSize.dimen_20,
          ),
        ),
      ),
      child: bodyWidget,
    ),
  );
}
