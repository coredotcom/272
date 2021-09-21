import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Prod_on_the_cart = [
    {
      "name": "ROG Strix G G531",
      "picture": "images/cats/c1.jpg",
      "price": 2399,
      "GTX/RTX": "GTX 1660ti",
      "RAM": "16GB",
      "CPU": "Intel Core i7"
    },
    {
      "name": "ROG Strix G G531",
      "picture": "images/cats/c1.jpg",
      "price": 2399,
      "GTX/RTX": "GTX 1660ti",
      "RAM": "16GB",
      "CPU": "Intel Core i7"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Prod_on_the_cart.length,
        itemBuilder: (context, index) {
          return new Single_cart(
            c_prod_name: Prod_on_the_cart[index]["name"],
            c_prod_cpu: Prod_on_the_cart[index]["CPU"],
            c_prod_grtx: Prod_on_the_cart[index]["GTX/RTX"],
            c_prod_pic: Prod_on_the_cart[index]["picture"],
            c_prod_pr: Prod_on_the_cart[index]["price"],
            c_prod_ram: Prod_on_the_cart[index]["RAM"],
          );
        });
  }
}

class Single_cart extends StatelessWidget {
  final c_prod_name;
  final c_prod_pic;
  final c_prod_grtx;
  final c_prod_pr;
  final c_prod_ram;
  final c_prod_cpu;

  Single_cart(
      {this.c_prod_name,
      this.c_prod_pic,
      this.c_prod_cpu,
      this.c_prod_pr,
      this.c_prod_ram,
      this.c_prod_grtx});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(c_prod_pic),
        title: new Text(
          c_prod_name,
          style: TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w800),
        ),
        subtitle: new Column(
          children: <Widget>[
            Divider(),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("CPU: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    c_prod_cpu,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(00.0, 8.0, 8.0, 8.0),
                  child: new Text("CARD: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    c_prod_grtx,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(00.0, 8.0, 8.0, 8.0),
                  child: new Text("RAM: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    c_prod_ram,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                " Price: \$$c_prod_pr",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                ),
              ),
            ),
            new Container(

            ),
          ],
        ),
      ),
    );
  }
}
