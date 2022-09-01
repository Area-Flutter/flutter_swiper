import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {
  // const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false,),
      ],
      child: MyApp(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Películas',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => DetailsScreen()
        },
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(color: Colors.amberAccent)));
  }
}
