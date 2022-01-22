
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class DrugsBloc {
  final Repository _repository = Repository();
  final drugsFetch = PublishSubject<DrugsModel>();
  Stream<DrugsModel> get fetchDrugs => drugsFetch.stream;
  getDrugs() async {
    var results = await _repository.getDrugs();
    if (results.isSucces) {
      DrugsModel drugsResult = DrugsModel.fromJson(results.result);
      drugsFetch.sink.add(drugsResult);
    }
  }
  dispose1() {
    drugsFetch.close();
  }
}
final drugsBloc = DrugsBloc();
