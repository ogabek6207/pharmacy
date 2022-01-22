import 'package:pharmacy/src/model/database/data_base_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class CardBloc {
  final Repository _repository = Repository();
  final drugsFetch = PublishSubject<List<CardDatabaseModel>>();

  Stream<List<CardDatabaseModel>> get fetchDrugs => drugsFetch.stream;

  getDrugs() async {
    var results = await _repository.getProduct();
    drugsFetch.sink.add(results);
  }

  dispose() {
    drugsFetch.close();
  }
}

final cardBloc = CardBloc();
