import 'dart:convert';

import 'package:flutter/material.dart';

class BaseModel {
  bool isError = false;
  String message;
  dynamic data;

  BaseModel({this.isError, this.message, this.data});

  BaseModel.fromJson(Map<String, dynamic> jsonData) {
    Map json = jsonData;
    if (json.containsKey('error')) {
      isError = json['error'] != null;
      message = isError ? jsonDecode(json['error'])['message'] : '';
    }
    if (json.containsKey('message')) {
      message = json['message'];
    }

    data = jsonData;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.isError;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }

  bool isSuccess() {
    // ignore: unrelated_type_equality_checks
    return !isError;
  }
}
