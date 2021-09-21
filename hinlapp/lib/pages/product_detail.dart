import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hinlapp/main.dart';

import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_pic;
  final product_detail_opr;
  final product_detail_new_pr;
  final product_detail_dts;
  final product_detail_dts2;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_pic,
    this.product_detail_opr,
    this.product_detail_new_pr,
    this.product_detail_dts,
    this.product_detail_dts2,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomePage()));
          },
          child: Text('Republic Of Gamers Laptop'),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_detail_pic),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$ ${widget.product_detail_opr}",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                      Expanded(
                          child: new Text(
                        "\$ ${widget.product_detail_new_pr}",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("GTX/RTX"),
                            content: new Text("Choose GTX/RTX"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("GTX/RTX")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("RAM"),
                            content: new Text("Choose RAM"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("RAM")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("CPU"),
                            content: new Text("Choose CPU"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("CPU")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy now"),
                ),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red,
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new Wrap(
            spacing: 800.0,
            runSpacing: 4.0,
            direction: Axis.horizontal,
            children: <Widget>[
              new Text(
                "    [Product details]",
                style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
              new Chip(
                label: new Text(widget.product_detail_dts),
                // labelPadding: const EdgeInsets.all(16.0),
              ),
              new Chip(
                label: Text(widget.product_detail_dts),
              )
            ],
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product name:",
                    style: TextStyle(color: Colors.black54)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand:",
                    style: TextStyle(color: Colors.black54)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("ASUS"),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition:",
                    style: TextStyle(color: Colors.black54)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("New"),
              ),
            ],
          ),
          Divider(),
          new Text(
            "    [Similar products]",
            style: TextStyle(
              fontSize: 17.5,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            height: 340.0,
            child: Similar_product(),
          )
        ],
      ),
    );
  }
}
class Similar_product extends StatefulWidget {
  @override
  _Similar_productState createState() => _Similar_productState();
}

class _Similar_productState extends State<Similar_product> {
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
          return Similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_pic: product_list[index]['picture'],
            prod_opr: product_list[index]['old_price'],
            prod_pr: product_list[index]['price'],
            prod_dts: product_list[index]["details"],
            prod_dts2: product_list[index]["dts2"],
          );
        });
  }
}
class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_opr;
  final prod_pr;
  final prod_dts;
  final prod_dts2;

  Similar_single_prod({
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
