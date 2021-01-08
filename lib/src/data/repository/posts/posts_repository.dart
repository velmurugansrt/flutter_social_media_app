import 'package:flutter_social_media_app/src/constants/api_services_urls.dart';
import 'package:flutter_social_media_app/src/data/network/http_client.dart';
import 'package:flutter_social_media_app/src/models/common/upload_response_model.dart';
import 'package:flutter_social_media_app/src/models/post/create_post_response_mode.dart';
import 'package:flutter_social_media_app/src/models/post/post_response_model.dart';

class PostsRepository {
  Future<PostResponseModel> fetchRequest() async {
    Map<String, dynamic> resp =
        await HTTPClient().getJSONRequest(url: ApiServiceUrls.getPosts);
    print('resp $resp');
    return PostResponseModel.fromJson(resp);
  }

  Future<CreatePostResponseModel> createPost(payload) async {
    Map<String, dynamic> resp = await HTTPClient()
        .postJSONRequest(url: ApiServiceUrls.newPost, data: payload);
    return CreatePostResponseModel.fromJson(resp);
  }

  Future<UploadResponseModel> uploadPhoto(path) async {
    Map<String, dynamic> resp = await HTTPClient()
        .uploadFile(url: ApiServiceUrls.uploadPost, path: path);
    return UploadResponseModel.fromJson(resp);
  }
}
