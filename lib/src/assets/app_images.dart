import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  static Color getColor(BuildContext context, Color color) {
    return (color != null) ? color : Theme.of(context).primaryColor;
  }

  static SvgPicture getSVGImage(
    String url,
    BuildContext context, {
    Color color,
    dynamic width,
    dynamic height,
    String iconName,
    bool isColor = true,
  }) {
    return SvgPicture.asset(
      url,
      color: isColor ? color ?? getColor(context, color) : null,
      width: width,
      height: height,
      key: Key(iconName),
    );
  }

  static SvgPicture createPost = SvgPicture.asset(
    'lib/src/assets/images/post_inactive.svg',
  );

  static Image appLogo = Image(
    image: AssetImage('lib/src/assets/images/app_logo.png'),
  );

  // static SvgPicture googleLogo = SvgPicture.asset(
  //   'lib/src/assets/images/google_logo.svg',
  // );

  static Image googleLogo = Image(
    image: AssetImage('lib/src/assets/images/google_logo.png'),
    width: 22,
    height: 22,
  );

  static SvgPicture speakerIcon = SvgPicture.asset(
    'lib/src/assets/images/speaker_icon.svg',
  );
  static SvgPicture camaraIcon = SvgPicture.asset(
    'lib/src/assets/images/camera_icon.svg',
  );
  static SvgPicture galleryIcon = SvgPicture.asset(
    'lib/src/assets/images/gallery_icon.svg',
  );

  // static SvgPicture googleLogo(BuildContext context,
  //     {Color color, double width, double height}) {
  //   return getSVGImage(
  //     'lib/src/assets/images/google_logo.svg',
  //     context,
  //     color: Colors.red,
  //     width: width,
  //     height: height,
  //     isColor: false,
  //   );
  // }

  static SvgPicture homeActive(BuildContext context,
      {Color color, double width, double height}) {
    return getSVGImage(
      'lib/src/assets/images/home_active.svg',
      context,
      width: width,
      height: height,
    );
  }
}
