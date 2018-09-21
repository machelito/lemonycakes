import 'package:flutter/material.dart';
import 'package:lemonycakes/carousel.dart';

void main() => runApp(LemonyCakesApp());

class LemonyCakesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lemony Cakes',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
      backgroundColor: const Color(0xff716999),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          InkWell(
            child: Container (
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration (
                color: const Color(0xff716999),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: new AssetImage(
                    'assets/images/rainbowcake.jpg',
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
                    return Carousel(category: 'cakes',);
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
                  'https://firebasestorage.googleapis.com/v0/b/lemony-cakes.appspot.com/o/InstagramCapture_3e104899-6f18-4d4b-a781-efb0b3991d87.jpg?alt=media&token=8f52ae06-316e-492c-918f-3ac424f2372e',
                ),
              ),
            ),
            child: ListTile (
              title: Text(
                'Galletas',
                style: TextStyle(fontFamily: 'KaushanScript', fontSize: 40.0, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Carousel(category: 'cookies',);
                }));
              },
            )
          ),
          Container (
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration (
              color: Colors.lightBlueAccent,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: new AssetImage(
                  'assets/images/cupcakes.jpg',
                ),
              ),
            ),
            child: ListTile (
              title: Text(
                'Cupcakes',
                style: TextStyle(fontFamily: 'KaushanScript', fontSize: 40.0, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Carousel(category: 'cupcakes',);
                }));
              },
            )
          ),
          Container (
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration (
              color: Colors.redAccent,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: new AssetImage(
                  'assets/images/youtube.jpg',
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
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff716999),
              ),
              child: Center(
                child: Image(
                    image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            ListTile(
              title: Text('Favoritos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cerrar sesión'),
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