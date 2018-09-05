import 'package:flutter/material.dart';
import 'package:lemonycakes/detail.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  PageController controller;
  int currentPage = 0;
  var images = ['assets/images/unicornio.jpg',
                'assets/images/toy_story.jpg',
                'assets/images/coco.jpg',
                'assets/images/globo.jpg',
                'assets/images/cars.jpg',];

  var titles = ['Unicornio',
  'Toy Story',
  'Coco',
  'Globo',
  'Cars',];

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7c94b6),
      appBar: AppBar(
        title: Text("Tortas"),
      ),
      body: Center(
        child: Container(
          child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: controller,
              itemBuilder: (context, index) => _builder(index),
          ),
        ),
      ),
    );
  }

  Widget _builder(int index) {
    return AnimatedBuilder(
      animation: controller,
      child: GestureDetector(
        child: Center(
          child: Hero(
              tag: images[index%5],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  images[index%5],
                  fit: BoxFit.fill,
                ),
              )
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(
              tag: images[index%5],
              title: titles[index%5],
            );
          }));
        },
      ),
      builder: (context, child) {
        double value = 1.0;

        if (controller.position.haveDimensions) {
          value = controller.page - index;
        } else {
          value = currentPage.toDouble() - index;
        }
        value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
    );
  }

}