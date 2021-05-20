import 'package:animes_provider/models/anime_model.dart';
import 'package:flutter/foundation.dart';

class AnimesController extends ChangeNotifier {
  List<AnimeModel> _animeList = [
    AnimeModel("Re: Zero", false),
    AnimeModel("Boku dake ga inai machi", true),
    AnimeModel("Bleach", true),
    AnimeModel("Naruto", false),
    AnimeModel("Code Geass", false),
  ];

  List<AnimeModel> getAnimeList() {
    return this._animeList;
  }

  void toggleFavorite(AnimeModel animeModel) {
    animeModel.toggleFavorite();
    notifyListeners();
  }
}
