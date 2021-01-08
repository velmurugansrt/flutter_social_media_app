import 'package:flutter_social_media_app/src/models/base/base_model.dart';

class PostResponseModel extends BaseModel {
  List<Posts> posts;
  UserProfile userProfile;

  PostResponseModel({this.posts, this.userProfile});

  PostResponseModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (data != null) {
      if (data['posts'] != null) {
        posts = new List<Posts>();
        data['posts'].forEach((v) {
          posts.add(Posts.fromJson(v));
        });
      }
      userProfile = data['userProfile'] != null
          ? new UserProfile.fromJson(data['userProfile'])
          : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    if (this.userProfile != null) {
      data['userProfile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class Posts {
  String target;
  int views;
  String heading;
  int createAt;
  String type;
  String link;
  String text;
  List<String> images;
  bool isShared;
  bool isLiked;
  bool isBookmarked;
  OwnerProfile ownerProfile;
  String id;
  int totalComments;
  int totalLikes;
  int totalShared;

  Posts(
      {this.target,
      this.views,
      this.heading,
      this.createAt,
      this.type,
      this.link,
      this.text,
      this.images,
      this.isShared,
      this.isLiked,
      this.isBookmarked,
      this.ownerProfile,
      this.id,
      this.totalComments,
      this.totalLikes,
      this.totalShared});

  Posts.fromJson(Map<String, dynamic> json) {
    target = json['target'];
    views = json['views'];
    heading = json['heading'];
    createAt = json['createAt'];
    type = json['type'];
    link = json['link'];
    text = json['text'];
    images = json['images'].cast<String>();
    isShared = json['isShared'];
    isLiked = json['isLiked'];
    isBookmarked = json['isBookmarked'];
    ownerProfile = json['ownerProfile'] != null
        ? new OwnerProfile.fromJson(json['ownerProfile'])
        : null;
    id = json['id'];
    totalComments = json['totalComments'];
    totalLikes = json['totalLikes'];
    totalShared = json['totalShared'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['target'] = this.target;
    data['views'] = this.views;
    data['heading'] = this.heading;
    data['createAt'] = this.createAt;
    data['type'] = this.type;
    data['link'] = this.link;
    data['text'] = this.text;
    data['images'] = this.images;
    data['isShared'] = this.isShared;
    data['isLiked'] = this.isLiked;
    data['isBookmarked'] = this.isBookmarked;
    if (this.ownerProfile != null) {
      data['ownerProfile'] = this.ownerProfile.toJson();
    }
    data['id'] = this.id;
    data['totalComments'] = this.totalComments;
    data['totalLikes'] = this.totalLikes;
    data['totalShared'] = this.totalShared;
    return data;
  }
}

class OwnerProfile {
  String profileImg;
  String name;
  String uid;

  OwnerProfile({this.profileImg, this.name, this.uid});

  OwnerProfile.fromJson(Map<String, dynamic> json) {
    profileImg = json['profileImg'];
    name = json['name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileImg'] = this.profileImg;
    data['name'] = this.name;
    data['uid'] = this.uid;
    return data;
  }
}

class UserProfile {
  String profileImg;
  String name;
  String userId;
  bool isFriend;

  UserProfile({this.profileImg, this.name, this.userId, this.isFriend});

  UserProfile.fromJson(Map<String, dynamic> json) {
    profileImg = json['profileImg'];
    name = json['name'];
    userId = json['userId'];
    isFriend = json['isFriend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileImg'] = this.profileImg;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['isFriend'] = this.isFriend;
    return data;
  }
}
