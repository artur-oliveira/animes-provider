class AnimeModel {
  String _name;
  bool _isFavorite;

  AnimeModel(this._name, this._isFavorite);

  String getName() {
    return this._name;
  }

  bool isFavorite() {
    return this._isFavorite;
  }

  void toggleFavorite() {
    this._isFavorite = !this._isFavorite;
  }

}