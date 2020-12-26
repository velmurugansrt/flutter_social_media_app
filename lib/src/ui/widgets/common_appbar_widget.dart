import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';
import 'package:flutter_social_media_app/src/assets/theme/app_colors.dart';
import 'package:flutter_social_media_app/src/constants/app_constants.dart';

AppBar commonAppbarWidget(
    String title, String count, Function callback, BuildContext context) {
  final double notificatinBadgeSize = AppWidgetSize.dimen_15;
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context).primaryTextTheme.headline6,
      textAlign: TextAlign.center,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(AppWidgetSize.dimen_20),
      ),
    ),
    actions: <Widget>[
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notification_important,
            ),
            onPressed: () => int.parse(count) > 0
                ? callback(AppConstants.NOTIFICATION)
                : null,
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(
                left: notificatinBadgeSize,
                bottom: AppWidgetSize.dimen_10,
              ),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.NOTIFICATION_COLOR,
                borderRadius: BorderRadius.circular(notificatinBadgeSize / 2),
              ),
              constraints: BoxConstraints(
                minWidth: notificatinBadgeSize,
                minHeight: notificatinBadgeSize,
              ),
              child: Text(
                count,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
      IconButton(
        icon: const Icon(
          Icons.search,
        ),
        onPressed: () {},
      ),
    ],
  );
}
