import 'dart:convert';

import '../../common/constants/api_constants.dart';
import '../../common/services/api_service.dart';
import '../models/city_model.dart';

abstract interface class Repository {
  const Repository();

  Future<List<CityModel>> getAllUser();
}

class RepositoryImp extends Repository {
  final ApiService apiService;
  const RepositoryImp(this.apiService);

  @override
  Future<List<CityModel>> getAllUser() async {
    String response = await apiService.request(ApiConstants.allCitiesPath);
    final list = List<Map<String, Object?>>.from(jsonDecode(response) as List)
        .map(CityModel.fromJson)
        .toList();
    return list;
  }
}
