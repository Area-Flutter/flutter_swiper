// ignore_for_file: prefer_is_empty

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

// ignore: use_key_in_widget_constructors
class CardSwiper extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);
  final List<Movie> movies;

  const CardSwiper({
    Key? key, 
    required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // ignore: unnecessary_this
    if(this.movies.length == 0){
      // ignore: sized_box_for_whitespace
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      // color: Colors.redAccent,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.5,
        itemBuilder: ( _ , int index){

          final movie = movies[index];
          // ignore: avoid_print
          print(movie.fullPosterImg);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }
}