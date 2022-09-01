import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/search/search_delagate.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    // ignore: avoid_print
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        // ignore: avoid_unnecessary_containers
        appBar: AppBar(
          title: const Text('Películas'),
          elevation: 0,
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        // ignore: avoid_unnecessary_containers
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
