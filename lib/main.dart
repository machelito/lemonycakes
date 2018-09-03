import 'package:flutter/material.dart';
import 'package:lemonycakes/carousel.dart';
import 'package:lemonycakes/detail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lemony Cakes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text('Lemony Cakes'),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Container (
                padding: EdgeInsets.all(50.0),
                decoration: BoxDecoration (
                  color: Colors.orangeAccent
                ),
                child: ListTile (
                  leading: const Icon(Icons.cake),
                  title: Text('Tortas'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Carousel();
                    }));
                  },
                )
            ),
          ),
          Container (
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration (
                color: Colors.greenAccent,
              ),
              child: ListTile (
                  leading: const Icon(Icons.cake),
                  title: Text('Galletas')
              )
          ),
          Container (
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration (
                  color: Colors.lightBlueAccent
              ),
              child: ListTile (
                  leading: const Icon(Icons.cake),
                  title: Text('Cupcakes')
              )
          ),
          Container (
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration (
                  color: Colors.redAccent
              ),
              child: ListTile (
                  leading: const Icon(Icons.cake),
                  title: Text('Tutoriales')
              )
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

}