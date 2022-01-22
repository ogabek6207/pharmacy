
import 'package:pharmacy/src/model/drugs_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _repository = Repository();
  var searchFetch = PublishSubject<DrugsModel>();
  Stream<DrugsModel> get getSearchInfo => searchFetch.stream;
getSearch(String s) async {
  var response = await _repository.getSearch(s);
  if(response.isSucces){
    DrugsModel result = DrugsModel.fromJson(response.result);
    searchFetch.sink.add(result);

  }

}
dispose(){
  searchFetch.close();
}
}
final searchBloc =SearchBloc();