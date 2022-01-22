import 'dart:convert';
import 'package:pharmacy/src/model/story_model.dart';
import 'package:pharmacy/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class FavouriteStoryBloc {
  final Repository _repository = Repository();
  final favouriteStoryFetch = PublishSubject<List<StoryModel>>();

  Stream<List<StoryModel>> get fetchFavouriteStory => favouriteStoryFetch.stream;

  getStory() async {
    var result = await _repository.getStory();
    if (result.isSucces) {
      var storyModel = storyModelFromJson(json.encode(result.result));
      favouriteStoryFetch.sink.add(storyModel);
    }
  }

  dispose() {
    favouriteStoryFetch.close();
  }
}

final favouritestoryBloc = FavouriteStoryBloc();
