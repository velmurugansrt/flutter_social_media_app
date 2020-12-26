import 'package:flutter_social_media_app/src/config/app_config.dart';

class ApiServiceUrls {
  static String baseURL = AppConfig.baseURL;
  static String newPost = baseURL + 'posts/newpost';
  static String authSignin = baseURL + 'auth/singin';
  static String uploadPost = baseURL + 'posts/upload';
  static String getPosts = baseURL + 'posts';
}
