import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CardSwiper extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: size.height * 0.6,
      // color: Colors.redAccent,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.5,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }
}