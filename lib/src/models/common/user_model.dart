class UserModel {
  String displayName;
  String email;
  String photoURL;
  String uid;

  UserModel({this.displayName, this.email, this.photoURL, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoURL'] = this.photoURL;
    data['uid'] = this.uid;
    return data;
  }
}
