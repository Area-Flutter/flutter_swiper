//Proveedor de información
// ignore_for_file: avoid_print

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'b2418a66f53ad930cfde7200a241256b';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  Map<int, List<Cast>> moviesCast = {};

  MoviesProvider() {
    print('Inicializado');
    // ignore: unnecessary_this
    this.getOnDisplayMovies();
    // ignore: unnecessary_this
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    _popularPage++;
    // ignore: unnecessary_this
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    // print(nowPlayingResponse.results[1].title);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    // var url = Uri.https(_baseUrl, '3/movie/popular',
    //     {'api_key': _apiKey, 'language': _language, 'page': '1'});
    // final response = await http.get(url);
    // ignore: unnecessary_this
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    // print(nowPlayingResponse.results[1].title);
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    print('Pidiendo información al servidor - Cast');
    // ignore: unnecessary_this
    final jsonData =
        // ignore: unnecessary_this
        await this._getJsonData('3/movie/$movieId/credits', _popularPage);
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    // print(nowPlayingResponse.results[1].title);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
    // print(popularMovies[0]);
    // notifyListeners();
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
