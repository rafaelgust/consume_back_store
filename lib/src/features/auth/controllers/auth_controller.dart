import 'dart:convert';

import 'package:consumestore/src/core/services/auth_service/dto/login_credential.dart';
import 'package:consumestore/src/core/services/auth_service/models/tokenization_model.dart';
import 'package:consumestore/src/core/services/database_service/database_service.dart';
import 'package:consumestore/src/core/services/http_services/http_service.dart';

import 'package:flutter/material.dart';

import '../exceptions/auth_exception.dart';

class AuthController extends ChangeNotifier {
  final HttpService service;
  final DataBaseService database;

  AuthController(this.service, this.database) {
    _idle();
  }

  final credentials = LoginCredential();

  AuthStates state = IntialState();

  bool get isLogged => state is Logged;

  _idle() async {
    String? accessToken = await database.getAccessToken();
    String? refreshToken = await database.getRefreshToken();

    if (accessToken == null || refreshToken == null) return;

    TokenizationModel tokens =
        TokenizationModel(accessToken: accessToken, refreshToken: refreshToken);

    state = Logged(tokens);
    notifyListeners();
  }

  _setTokens(TokenizationModel tokenization) async {
    await database.saveAccessToken(tokenization.accessToken);
    await database.saveRefreshToken(tokenization.refreshToken);
    state = Logged(tokenization);
    notifyListeners();
  }

  _removeTokens() async {
    await database.removeTokens();
    state = Unlogged();
    notifyListeners();
  }

  Future<void> login() async {
    var basic = '${credentials.email.value}:${credentials.password.value}';
    basic = base64Encode(basic.codeUnits);

    try {
      final response =
          await service.tokenBasic(url: '/auth/login', token: basic);
      final tokenization = TokenizationModel.fromJson(response);

      await _setTokens(tokenization);
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
        await _setTokens(tokenization);
      } catch (e) {
        await _removeTokens();
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
