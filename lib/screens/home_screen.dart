import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: avoid_unnecessary_containers
        appBar: AppBar(
          title: const Text('Películas'),
          elevation: 0,
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        // ignore: avoid_unnecessary_containers
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(), 
              MovieSlider()
            ],
          ),
        ));
  }
}
