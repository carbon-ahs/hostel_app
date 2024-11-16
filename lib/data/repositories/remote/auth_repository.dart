import 'package:hostel_app/data/models/auth_data_model/auth_data.dart';

import '../../../core/services/api_service.dart';
import '../../../utils/config/env.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<AuthData>? login(Map<String, dynamic> body) async {
    dynamic json;
    try {
      json = await apiService.callApi(
          "POST",
          Uri.parse('${Env().apiBaseUrl}/login'),
          {'Content-Type': 'application/json'},
          body);
      if (json == null) throw Exception('Bad Response');
    } catch (error) {
      throw Exception(error.toString());
    } finally {
      return AuthData.fromJson(json);
      // return Data.fromJson(json);
    }
  }
}
