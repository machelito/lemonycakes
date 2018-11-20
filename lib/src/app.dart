library app;

import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

part 'backdrop.dart';
part 'carousel.dart';
part 'detail.dart';
part 'favorites.dart';
part 'item.dart';
part 'login.dart';
part 'settings.dart';

class LemonyCakesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lemony Cakes',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: const Color(0xfffafafa),
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
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
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  void onTabTapped(int index) {
    setState(() {
      switch (index) {
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return FavoritesScreen();
              }));
          break;
        case 2:
          Navigator.push(context,
              MaterialPageRoute(builder: (_) {
                return SettingsScreen();
              }));
          break;
        default:
          // do nothing;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                  child: Text(
                    "Explorar",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 25.0),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 3.0,
                    color: const Color(0xffff7282),
                    child: InkWell(
                      child: Padding(
                       padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                        child: Text(
                          "Galería",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'KaushanScript',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                              return Carousel(
                                category: 'cakes',
                              );
                            }));
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                              elevation: 3.0,
                              color: const Color(0xff65dad0),
                              child: InkWell(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                                  child: Text(
                                    "Recetas",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'KaushanScript',
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return Carousel(
                                      category: 'cakes',
                                    );
                                  }));
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              elevation: 3.0,
                              color: const Color(0xfff3b163),
                              child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
                                  child: Text(
                                    "Tutoriales",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'KaushanScript',
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                        return Carousel(
                                          category: 'cakes',
                                        );
                                      }));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                  child: Text(
                    "Populares",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: onTabTapped,
        fixedColor: const Color(0xff716999),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text("Explorar"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favoritos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Configuración"),
          ),
        ],
      ),
    );
  }
}
