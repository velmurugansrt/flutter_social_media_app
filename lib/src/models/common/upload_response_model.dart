import 'package:flutter_social_media_app/src/models/base/base_model.dart';

class UploadResponseModel extends BaseModel {
  String imageUrl;
  String message;

  UploadResponseModel({this.imageUrl, this.message});

  UploadResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (data != null) {
      imageUrl = data['imageUrl'];
      message = data['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['message'] = this.message;
    return data;
  }
}
