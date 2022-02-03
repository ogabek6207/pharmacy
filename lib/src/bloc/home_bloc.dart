
import 'package:pharmacy/src/model/choice_model.dart';
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/model/sales_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository = Repository();
  final salesFetch = PublishSubject<SalesModel>();
  final drugsFetch = PublishSubject<DrugsModel>();
  final choiceFetch = PublishSubject<ChoiceModel>();
  final drugsCardFetch = PublishSubject<List<DrugsResult>>();
  final drugsFavFetch = PublishSubject<List<DrugsResult>>();

  Stream<SalesModel> get fetchSales => salesFetch.stream;

  Stream<DrugsModel> get fetchDrugs => drugsFetch.stream;

  Stream<ChoiceModel> get fetchChoice => choiceFetch.stream;

  Stream<List<DrugsResult>> get fetchCardDrugs => drugsCardFetch.stream;

  Stream<List<DrugsResult>> get fetchFavDrugs => drugsFavFetch.stream;

  getSales() async {
    var response = await _repository.getSales();
    if (response.isSucces) {
      SalesModel salesModel = SalesModel.fromJson(response.result);
      salesFetch.sink.add(salesModel);
    }
  }

  DrugsModel? result;




  getDrugsCard() async {
    List<DrugsResult> database = await _repository.getProduct();
    drugsCardFetch.sink.add(database);
  }

  ///fav
  getDrugsFav() async {
    List<DrugsResult> database = await _repository.getFavProduct();
    drugsFavFetch.sink.add(database);
  }

  getDrugs() async {
    var response = await _repository.getDrugs();
    if (response.isSucces) {
      result = DrugsModel.fromJson(response.result);
      List<DrugsResult> database = await _repository.getProduct();
      List<DrugsResult> databaseFav = await _repository.getFavProduct();
      for (int i = 0; i < result!.results.length; i++) {
        for (int j = 0; j < database.length; j++) {
          if (result!.results[i].id == database[j].id) {
            result!.results[i].cardCount = database[j].cardCount;
            break;
          }
        }
        for (int j = 0; j < databaseFav.length; j++) {
          if (result!.results[i].id == databaseFav[j].id) {
            result!.results[i].favSelected = true;
            break;
          }
        }
      }

      drugsFetch.sink.add(result!);
    }
  }

  ///fav
    updateFavDrugs(
      DrugsResult data,
      bool like,
      ) async {
    for (int i = 0; i < result!.results.length; i++) {
      if (result!.results[i].id == data.id) {
        result!.results[i].favSelected = like;
        break;
      }
    }
    if (like) {
      _repository.saveFavProducts(data);
    } else {
      _repository.deleteFavProducts(data.id);
    }
    List<DrugsResult> database = await _repository.getFavProduct();

    drugsFetch.sink.add(result!);
    drugsFavFetch.sink.add(database);
  }

  updateCardDrugs(
      DrugsResult data,
      ) async {
    if (data.cardCount == 0) {
      _repository.deleteProducts(data.id);
    } else {
      _repository.updateProduct(data);
    }
    List<DrugsResult> database = await _repository.getProduct();
    drugsCardFetch.sink.add(database);
  }

  updateDrugs(
      bool type,
      int id,
      int cardCount,
      ) async {
    DrugsResult? data;
    for (int i = 0; i < result!.results.length; i++) {
      if (result!.results[i].id == id) {
        result!.results[i].cardCount = cardCount;
        data = result!.results[i];
        break;
      }
    }
    if (cardCount == 0) {
      _repository.deleteProducts(id);
    } else {
      if (type) {
        _repository.saveProducts(data!);
      } else {
        _repository.updateProduct(data!);
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
