import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hostel_app/data/models/auth_data_model/auth_data.dart';
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
      AuthData? authResponse = await authRepository
          .login({'email': authDto.email, 'password': authDto.password});

      Log.create(
          Level.info, "Successfully Logged In: ${jsonEncode(authResponse)}");
      notifyListeners();
    } catch (error) {
      Log.create(
          Level.info,
          "Error Logged In: ${authRepository.login({
                'email': authDto.email,
                'password': authDto.password
              })}");
      throw Exception(error.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
