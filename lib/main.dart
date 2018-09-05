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
        fontFamily: 'Roboto',
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7c94b6),
      appBar: AppBar(
        title: Text('Lemony Cakes'),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Container (
                padding: EdgeInsets.all(50.0),
                decoration: BoxDecoration (
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: new NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/0/04/Pound_layer_cake.jpg',
                    ),
                  ),
                ),
                child: ListTile (
                  title: Text(
                    'Tortas',
                    style: TextStyle(fontFamily: 'KaushanScript', fontSize: 40.0, color: Colors.white),
                  ),
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
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: new NetworkImage(
                    'https://scontent.faep8-2.fna.fbcdn.net/v/t1.0-9/22089123_1545827442121945_3302186117828413746_n.jpg?_nc_cat=0&oh=8f1e63013e1a5db3a6e5f9bc19618ef0&oe=5C289EB7',
                  ),
                ),
              ),
              child: ListTile (
                  title: Text(
                    'Galletas',
                    style: TextStyle(fontFamily: 'KaushanScript', fontSize: 40.0, color: Colors.white),
                  )
              )
          ),
          Container (
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration (
                color: Colors.lightBlueAccent,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: new NetworkImage(
                    'http://www.allwhitebackground.com/images/2/2582-190x190.jpg',
                  ),
                ),
              ),
              child: ListTile (
                  title: Text(
                    'Cupcakes',
                    style: TextStyle(fontFamily: 'KaushanScript', fontSize: 40.0, color: Colors.white),
                  )
              )
          ),
          Container (
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration (
                color: Colors.redAccent,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: new NetworkImage(
                    'http://energy.go.th/2015/wp-content/uploads/2017/07/youtube-512.png',
                  ),
                ),
              ),
              child: ListTile (
                  title: Text(
                    'Tutoriales',
                    style: TextStyle(fontFamily: 'KaushanScript', fontSize: 40.0, color: Colors.white),
                  ),
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