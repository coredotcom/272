import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hinlapp/componets/horizontal_listview.dart';
import 'package:hinlapp/componets/products.dart';
import 'package:hinlapp/pages/cart.dart';
import 'package:hinlapp/main.dart';
import 'home.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          //  AssetImage('images/ql.jpg'), Anh nay de lam avatar
          AssetImage('images/p1.jpg'),
          AssetImage('images/p2.jpg'),
          AssetImage('images/p4.jpg'),
          AssetImage('images/p5.jpg'),
          AssetImage('images/p6.jpg'),
          AssetImage('images/p7.jpg'),
          AssetImage('images/psj.jpg'),
        ],
        autoplay: true,
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(microseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Republic Of Gamers Laptop'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Trần Tiến Quyết'),
              accountEmail: Text('quyetquanybty1@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.asset('images/products/ql.jpg'),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.lightGreenAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          //image_carousel,
          Divider(),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17.5,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          HorizontalList(),
          Divider(),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Recent products',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17.5,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Flexible(child: Products()),

        ],
      ),
    );
  }
}