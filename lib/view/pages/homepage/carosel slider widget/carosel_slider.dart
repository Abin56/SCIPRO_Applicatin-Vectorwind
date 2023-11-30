import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Center(
        child: CarouselSlider(
          items: [
           Column(
             children: [
               Image.asset(
                    imagesList[0],
                    fit: BoxFit.fill,
                  ),
                  const Text('Item 1', style: TextStyle(color: Colors.black))
             ],
           ),
            Column(
             children: [
               Image.asset(
                    imagesList[3],
                    fit: BoxFit.fill,
                  ),
                  const Text('Item 1', style: TextStyle(color: Colors.black))
             ],
           ),
            Column(
             children: [
               Image.asset(
                    imagesList[1],
                    fit: BoxFit.fill,
                  ),
                  const Text('Item 1', style: TextStyle(color: Colors.black))
             ],
           ),
           
        
          ],
          options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
 final List<String> imagesList = [
    'assets/images/main6gopika.jpg',
    'assets/images/mainsanush1.jpg',
    'assets/images/main10vishnu.jpg',
    'assets/images/main13archanaartist.jpg',
  ];
