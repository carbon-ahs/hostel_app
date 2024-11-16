import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../core/services/log_service.dart';
import '../data/dto/auth_dto.dart';
import '../data/models/data_model/data.dart';
import '../data/repositories/remote/auth_repository.dart';

// ignore: camel_case_types
class convenient extends ChangeNotifier {
  final AuthRepository authRepository;
  var isLoading = false;
  var _isObscure = true;

  bool get isObscure => _isObscure;

  convenient({required this.authRepository});

  void toggleObscureness() {
    _isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> login(BuildContext context, AuthDto authDto) async {
    isLoading = true;
    notifyListeners();
    try {
      Data? authResponse = await authRepository
          .login({'username': authDto.email, 'password': authDto.password});

      Log.create(
          Level.info, "Successfully Logged In: ${jsonEncode(authResponse)}");
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
