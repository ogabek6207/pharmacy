import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class ItemListBloc {
  final Repository _repository = Repository();
  final itemListFetch = PublishSubject<DrugsModel>();

  Stream<DrugsModel> get fetchItemList => itemListFetch.stream;

  getDrugs() async {
    var results = await _repository.getDrugs();
    if (results.isSucces) {
      DrugsModel drugsResult = DrugsModel.fromJson(results.result);
      itemListFetch.sink.add(drugsResult);
    }
  }

  dispose() {
    itemListFetch.close();
  }
}

final itemListBloc = ItemListBloc();
