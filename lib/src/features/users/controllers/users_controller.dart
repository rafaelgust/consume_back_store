import 'package:consumestore/src/core/services/http_services/http_service.dart';

import 'package:flutter/material.dart';

import '../models/users_model.dart';

class UsersController extends ChangeNotifier {
  final HttpService service;
  UsersController(this.service) {
    _getUsers();
  }

  List<UsersModel> users = [];

  Future _getUsers() async {
    final response = await service.fetchGet('http://192.168.139.1:3000/user/');

    users = (response as List).map((e) => UsersModel.fromMap(e)).toList();
  }
}
