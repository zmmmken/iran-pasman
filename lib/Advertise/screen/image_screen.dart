import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {

  List<String> images;


  ImageScreen(this.images);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1, height: size.width - 100),
            items: _items()
        ),
      ),
    );
  }

  List<Widget> _items(){
    List<Widget> res = [];
    res.add(Hero(tag: images[0], child: Image.asset(images[0], fit: BoxFit.cover)));
    for(int i=1 ; i < images.length ; i++){
      res.add(Image.asset(images[i], fit: BoxFit.cover));
    }
    return res;
  }
}
