import 'dart:convert';
import 'package:pharmacy/src/model/region_model1.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class RegionBloc {
  final Repository _repository = Repository();
  final regionFetch = PublishSubject<List<RegionModel>>();

  Stream<List<RegionModel>> get fetchRegion => regionFetch.stream;

  getRegion() async {
    var result = await _repository.getRegion();
    if (result.isSucces) {
      var regionModel = regionModelFromJson(json.encode(result.result));
      regionModel[0].isSelected = true;
      regionFetch.sink.add(regionModel);
    }
  }

  updateRegion(List<RegionModel> data, int id) {
    for (int i = 0; i < data.length; i++) {
      data[i].isSelected = false;
    }
    data[id].isSelected = true;
    regionFetch.sink.add(data);
  }

  dispose() {
    regionFetch.close();
  }
}

final regionBloc = RegionBloc();
