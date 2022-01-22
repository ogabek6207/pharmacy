
import 'package:pharmacy/src/model/category_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final Repository _repository = Repository();
  final categoryFetch = PublishSubject<CategoryModel>();

  Stream<CategoryModel> get fetchCategory => categoryFetch.stream;

  getCategory() async {
    var response = await _repository.getCategory();
    if (response.isSucces) {
      CategoryModel categoryModel = CategoryModel.fromJson(response.result);
      categoryFetch.sink.add(categoryModel);
    }
  }

  dispose() {
    categoryFetch.close();
  }
}

final categoryBloc = CategoryBloc();
