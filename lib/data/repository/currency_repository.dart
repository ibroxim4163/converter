import 'dart:convert';

import '../../data/constants/api_constants.dart';
import '../../data/services/api_service.dart';
import '../models/city_model.dart';

abstract interface class Repository {
  const Repository();

  Future<List<CurrencyModel>> getAllCurrencies();
}

class RepositoryImp extends Repository {
  final ApiService apiService;
  const RepositoryImp(this.apiService);

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    String response = await apiService.request(ApiConstants.allCitiesPath);
    final list = List<Map<String, Object?>>.from(jsonDecode(response) as List)
        .map(CurrencyModel.fromJson)
        .toList();
    return list;
  }
}
