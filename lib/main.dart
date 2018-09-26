import 'package:flutter/material.dart';
import 'package:lemonycakes/carousel.dart';
import 'package:lemonycakes/favorites.dart';
import 'package:lemonycakes/settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
  }


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
                image: new AssetImage(
                  'assets/images/cookies.jpg',
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
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FavoritesScreen();
                }));
                //
              },
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SettingsScreen();
                }));
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