// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_new, prefer_collection_literals, unnecessary_this
class UserModel {
  String? code;
  String? status;
  String? message;
  Data? data;

  UserModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  // tojson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code']    = this.code;
    data['status']  = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
  
}

class Data {
  String? id;
  String? username;
  String? password;
  String? fullname;
  String? imgProfile;
  String? status;

  // constructor
  Data({
    this.id,
    this.username,
    this.password,
    this.fullname,
    this.imgProfile,
    this.status,
  });

  // fromjson
  Data.fromJson(Map<String, dynamic> json) {
    id          = json['id'];
    username    = json['username'];
    password    = json['password'];
    fullname    = json['fullname'];
    imgProfile = json['img_profile'];
    status      = json['status'];
  }

  // tojson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']          = this.id;
    data['username']    = this.username;
    data['password']    = this.password;
    data['fullname']    = this.fullname;
    data['img_profile'] = this.imgProfile;
    data['status']      = this.status;
    return data;
  }
}