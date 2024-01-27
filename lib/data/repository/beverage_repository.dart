import 'package:flutter_como_un_pro/data/providers/beverage_api.dart';

import '../models/beverage/beverage_model.dart';

class BeverageRepository {
  final BeverageApi _beverageApi;

  BeverageRepository() : _beverageApi = BeverageApi();

  Future<Map<String, List<Beverage>>> getCompleteBeverageList() async {
    final res = await _beverageApi.getCompleteBeverageList();
    return res;
  }
}
