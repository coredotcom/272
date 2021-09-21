import 'package:flutter/material.dart';
import 'package:hinlapp/pages/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "ROG Strix G G531",
      "picture": "images/cats/c1.jpg",
      "old_price": 2700,
      "price": 2399,
      "details": "CPU :	Intel, Core i5 9800H, "
          " RAM:	8GB Up to 32G DDR4 "
          " GTX 1660 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Zephyus S",
      "picture": "images/cats/c3.jpg",
      "old_price": 5700,
      "price": 5599,
      "details": "CPU :	Intel, Core i7 9800K "
          " RAM:	16GB Up to 32GB DDR4 "
          " RTX 2080 ",
      "dts2": "No available!"
    },
    {
      "name": "ASUS TUF",
      "picture": "images/cats/c5.jpg",
      "old_price": 1700,
      "price": 1599,
      "details": "CPU :	Intel, Core i5 8800H, "
          " RAM:	8GB Up to 32GB DDR4 "
          " GTX 1050 ",
      "dts2": "No available!"
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!"
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!"
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c4.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
    {
      "name": "ROG Strix Scar III",
      "picture": "images/cats/c3.jpg",
      "old_price": 4700,
      "price": 4599,
      "details": "CPU :	Intel, Core i7 9900HK, "
          " RAM:	32GB Up to 64GB DDR4 "
          " RTX 1080 ",
      "dts2": "No available!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pic: product_list[index]['picture'],
              prod_opr: product_list[index]['old_price'],
              prod_pr: product_list[index]['price'],
              prod_dts: product_list[index]["details"],
              prod_dts2: product_list[index]["dts2"],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_opr;
  final prod_pr;
  final prod_dts;
  final prod_dts2;

  Single_prod({
    this.prod_name,
    this.prod_pic,
    this.prod_opr,
    this.prod_pr,
    this.prod_dts,
    this.prod_dts2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("Hydra 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_pic: prod_pic,
                        product_detail_opr: prod_opr,
                        product_detail_new_pr: prod_pr,
                        product_detail_dts: prod_dts,
                        product_detail_dts2: prod_dts2,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            prod_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        new Text(
                          "\$${prod_pr}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  child: Image.asset(
                    prod_pic,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
