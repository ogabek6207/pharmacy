
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class FavouriteBloc {
  final Repository _repository = Repository();
  final favouriteFetch = PublishSubject<DrugsModel>();
  Stream<DrugsModel> get fetchFavourite => favouriteFetch.stream;
  getDrugs() async {
    var results = await _repository.getDrugs();
    if (results.isSucces) {
      DrugsModel drugsResult = DrugsModel.fromJson(results.result);
      favouriteFetch.sink.add(drugsResult);
    }
  }
  dispose1() {
    favouriteFetch.close();
  }
}
final favouriteBloc = FavouriteBloc();
