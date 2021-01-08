import 'package:flutter_social_media_app/src/models/base/base_model.dart';

class CreatePostResponseModel extends BaseModel {
  String postId;
  String message;

  CreatePostResponseModel({this.postId, this.message});

  CreatePostResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (data != null) {
      postId = data['postId'];
      message = data['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['message'] = this.message;
    return data;
  }
}
