
import 'package:pharmacy/src/model/choice_model.dart';
import 'package:pharmacy/src/model/database/data_base_model.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/model/sales_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository = Repository();
  final salesFetch = PublishSubject<SalesModel>();
  final drugsFetch = PublishSubject<DrugsModel>();
  final choiceFetch = PublishSubject<ChoiceModel>();

  Stream<SalesModel> get fetchSales => salesFetch.stream;

  Stream<DrugsModel> get fetchDrugs => drugsFetch.stream;

  Stream<ChoiceModel> get fetchChoice => choiceFetch.stream;

  getSales() async {
    var response = await _repository.getSales();
    if (response.isSucces) {
      SalesModel salesModel = SalesModel.fromJson(response.result);
      salesFetch.sink.add(salesModel);
    }
  }

  DrugsModel? result;

  getDrugs() async {
    var response = await _repository.getDrugs();
    if (response.isSucces) {
      result = DrugsModel.fromJson(response.result);
      List database = await _repository.getProduct();
      for (int i = 0; i < result!.results.length; i++) {
        for (int j = 0; j < database.length; j++) {
          if (result!.results[i].id == database[j].id) {
            result!.results[i].cardCount = database[j].cardCount;
            break;
          }
        }
      }

      drugsFetch.sink.add(result!);
    }
  }

  update(int id, int type, int cardCount) {
    for (int i = 0; i < result!.results.length; i++) {
      if (result!.results[i].id == id) {
        result!.results[i].cardCount = cardCount;
        CardDatabaseModel databaseModel = CardDatabaseModel(
          id: result!.results[i].id,
          name: result!.results[i].name,
          image: result!.results[i].image,
          cardCount: cardCount,
          manufacturer: result!.results[i].description,
          price: result!.results[i].price,
          basePrice: result!.results[i].basePrice,
        );
        if (type == 1) {
          _repository.saveProducts(databaseModel);
        } else if (type == 2) {
          _repository.updateProduct(databaseModel);
        } else if (type == 3) {
          _repository.deleteProducts(databaseModel.id);
        }
      }
    }

    drugsFetch.sink.add(result!);
  }

  getChoice() async {
    var results = await _repository.getChoice();
    if (results.isSucces) {
      ChoiceModel choiceModel = ChoiceModel.fromJson(results.result);
      choiceFetch.sink.add(choiceModel);
    }
  }

  dispose() {
    salesFetch.close();
  }

  dispose1() {
    drugsFetch.close();
  }
}

final homeBloc = HomeBloc();
