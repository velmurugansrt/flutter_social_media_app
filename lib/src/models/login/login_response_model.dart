import 'package:flutter_social_media_app/src/models/base/base_model.dart';

class LoginResponseModel extends BaseModel {
  AuthUser user;
  LoginResponseModel({this.user});
  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (data != null) {
      user = data['user'] != null ? new AuthUser.fromJson(data['user']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class AuthUser {
  String uid;
  String accessToken;
  String refreshToken;
  Profile profile;
  bool emailVerified;
  int totalFriends;
  int totalFollowers;

  AuthUser(
      {this.uid,
      this.accessToken,
      this.refreshToken,
      this.profile,
      this.emailVerified,
      this.totalFriends,
      this.totalFollowers});

  AuthUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    emailVerified = json['emailVerified'];
    totalFriends = json['totalFriends'];
    totalFollowers = json['totalFollowers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['emailVerified'] = this.emailVerified;
    data['totalFriends'] = this.totalFriends;
    data['totalFollowers'] = this.totalFollowers;
    return data;
  }
}

class Profile {
  String gender;
  int createdAt;
  List friendRequests;
  String age;
  List followings;
  String deviceToken;
  String profileImg;
  String dob;
  String address;
  String district;
  List friends;
  bool agreedTnc;
  String uid;
  String zip;
  String mobileNumber;
  String email;
  String education;
  String mood;
  String name;
  String province;
  String country;

  Profile(
      {this.gender,
      this.createdAt,
      this.friendRequests,
      this.age,
      this.followings,
      this.deviceToken,
      this.profileImg,
      this.dob,
      this.address,
      this.district,
      this.friends,
      this.agreedTnc,
      this.uid,
      this.zip,
      this.mobileNumber,
      this.email,
      this.education,
      this.mood,
      this.name,
      this.province,
      this.country});

  Profile.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    createdAt = json['createdAt'];
    if (json['friendRequests'] != null) {
      friendRequests = json['friendRequests'];
    }
    age = json['age'];
    if (json['followings'] != null) {
      followings = json['followings'];
    }
    deviceToken = json['deviceToken'];
    profileImg = json['profileImg'];
    dob = json['dob'];
    address = json['address'];
    district = json['district'];
    if (json['friends'] != null) {
      friends = json['friends'];
    }
    agreedTnc = json['agreed_tnc'];
    uid = json['uid'];
    zip = json['zip'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    education = json['education'];
    mood = json['mood'];
    name = json['name'];
    province = json['province'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['createdAt'] = this.createdAt;
    if (this.friendRequests != null) {
      data['friendRequests'] = this.friendRequests;
    }
    data['age'] = this.age;
    if (this.followings != null) {
      data['followings'] = this.followings;
    }
    data['deviceToken'] = this.deviceToken;
    data['profileImg'] = this.profileImg;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['district'] = this.district;
    if (this.friends != null) {
      data['friends'] = this.friends;
    }
    data['agreed_tnc'] = this.agreedTnc;
    data['uid'] = this.uid;
    data['zip'] = this.zip;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    data['education'] = this.education;
    data['mood'] = this.mood;
    data['name'] = this.name;
    data['province'] = this.province;
    data['country'] = this.country;
    return data;
  }
}
