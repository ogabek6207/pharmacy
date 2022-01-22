

import 'package:pharmacy/src/data_base/database_helper.dart';
import 'package:pharmacy/src/model/auth/http_result.dart';
import 'package:pharmacy/src/model/database/data_base_model.dart';
import 'package:pharmacy/src/provider/app_provider.dart';

class Repository {
  final AppProvider _provider = AppProvider();
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<CardDatabaseModel>> getProduct() => databaseHelper.getProduct();

  Future<int> saveProducts(CardDatabaseModel item) =>
      databaseHelper.saveProducts(item);

  Future<int> deleteProducts(int id) => databaseHelper.deleteProducts(id);

  Future<int> updateProduct(CardDatabaseModel item) =>
      databaseHelper.updateProduct(item);

  Future<HttpResult> getCategory() => _provider.getCategory();

  Future<HttpResult> getSales() => _provider.getSales();

  Future<HttpResult> getDrugs() => _provider.getDrugs();

  Future<HttpResult> getChoice() => _provider.getChoice();

  Future<HttpResult> getRegion() => _provider.getRegion();

  Future<HttpResult> getStory() => _provider.getStory();

  Future<HttpResult> sendLogin(String number) => _provider.getLogin(number);

  Future<HttpResult> getSearch(String number) => _provider.getSearch();
}
