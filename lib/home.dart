import 'package:animes_provider/controllers/animes_controller.dart';
import 'package:animes_provider/models/anime_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    AnimesController animesController = Provider.of<AnimesController>(context);

    return ListView.builder(
      itemCount: animesController.getAnimeList().length,
      itemBuilder: (context, index) {
        return _buildItems(animesController.getAnimeList()[index]);
      },
    );
  }

  _buildItems(AnimeModel animeModel) {
    AnimesController animesController = Provider.of<AnimesController>(context);

    return ListTile(
      onTap: () => {animesController.toggleFavorite(animeModel)},
      title: Text(
        animeModel.getName(),
      ),
      trailing: animeModel.isFavorite()
          ? Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
            )
          : Icon(CupertinoIcons.star, color: Colors.amber),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Animes'),
            leading: Consumer<AnimesController>(
                builder: (context, animesController, widget) {
              return Center(
                child: Text(
                    "${animesController.getAnimeList().where((element) => element.isFavorite()).length}"),
              );
            })),
        body: Consumer<AnimesController>(
            builder: (context, animesController, widget) {
          return _buildList();
        }));
  }
}
