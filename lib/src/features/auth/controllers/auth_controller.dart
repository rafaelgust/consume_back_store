// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:consumestore/src/core/services/auth_service/dto/login_credential.dart';
import 'package:consumestore/src/core/services/auth_service/models/tokenization_model.dart';
import 'package:consumestore/src/core/services/http_services/http_service.dart';

import '../exceptions/auth_exception.dart';

class AuthController extends ChangeNotifier {
  final HttpService service;
  AuthController(this.service);

  final credentials = LoginCredential();

  AuthStates state = IntialState();

  bool get isLogged => state is Logged;

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
      if (e.toString().contains('403')) {
        throw AuthException('Email ou Senha inválida!', s);
      }
      throw AuthException('Tente novamente mais tarde!', s);
    }
  }

  Future<void> refreshToken() async {
    if (state is Logged) {
      String refreshToken = state.tokenization.refreshToken;
      try {
        final response = await service.refreshToken(refreshToken);
        final tokenization = TokenizationModel.fromJson(response);
        state = Logged(tokenization);
      } catch (e) {
        state = Unlogged();
      } finally {
        notifyListeners();
      }
    }
  }
}

class AuthStates {
  TokenizationModel tokenization;
  AuthStates(this.tokenization);
}

class IntialState implements AuthStates {
  @override
  late TokenizationModel tokenization;
}

class Logged implements AuthStates {
  @override
  TokenizationModel tokenization;
  Logged(this.tokenization);
}

class Unlogged implements AuthStates {
  @override
  late TokenizationModel tokenization;
}
