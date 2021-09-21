import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/cats/c2.jpg',
            image_caption: 'Strix Scar III',
          ),
          Category(
            image_location: 'images/cats/c1.jpg',
            image_caption: 'Strix G G531',
          ),
          Category(
            image_location: 'images/cats/c3.jpg',
            image_caption: 'Strix Zephyus S',
          ),

          Category(
            image_location: 'images/cats/c5.jpg',
            image_caption: 'Asus TUF ',
          ),
          Category(
            image_location: 'images/products/l1.png',
            image_caption: 'ROG G752VT',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 120.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
