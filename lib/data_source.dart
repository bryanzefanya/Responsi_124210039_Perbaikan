import 'package:responsi_124210039_2/base.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> getCategory() {
    return BaseNetwork.get("categories.php");
  }

  Future<Map<String, dynamic>> getMeals(String idCategory) {
    return BaseNetwork.get("filter.php?c=$idCategory");
  }

  Future<Map<String, dynamic>> getDetailMeals(String idMeals) {
    return BaseNetwork.get("lookup.php?i=$idMeals");
  }
}