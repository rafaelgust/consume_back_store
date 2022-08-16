import 'dart:convert';

import 'package:consumestore/src/core/services/auth_service/dto/login_credential.dart';
import 'package:consumestore/src/core/services/auth_service/models/tokenization_model.dart';
import 'package:consumestore/src/core/services/http_services/http_service.dart';
import 'package:flutter/material.dart';

import '../exceptions/auth_exception.dart';

class AuthController extends ChangeNotifier {
  final HttpService service;
  AuthController(this.service);

  final credentials = LoginCredential();

  AuthStates state = IntialState();

  Future<void> login() async {
    var basic = '${credentials.email.value}:${credentials.password.value}';
    basic = base64Encode(basic.codeUnits);

    try {
      final response =
          await service.tokenBasic(url: '/auth/login', token: basic);
      final tokenization = TokenizationModel.fromJson(response);

      state = Logged(tokenization);
      notifyListeners();
    } catch (e, s) {
      if (e == 403) {
        throw AuthException('Email ou Senha inválida!', s);
      }
      throw AuthException('Tente novamente mais tarde!', s);
    }
  }
}

abstract class AuthStates {}

class IntialState extends AuthStates {}

class Logged extends AuthStates {
  final TokenizationModel tokenization;

  Logged(this.tokenization);
}

class Unlogged extends AuthStates {}
