// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/auth_controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    return !Modular.get<AuthController>().isLogged;
  }
}
