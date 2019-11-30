library app;

import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'backdrop.dart';
part 'carousel.dart';
part 'detail.dart';
part 'explore.dart';
part 'favorites.dart';
part 'gallery.dart';
part 'home.dart';
part 'item.dart';
part 'login.dart';
part 'recipes.dart';
part 'settings.dart';
part 'translations.dart';
part 'trending.dart';
part 'tutorials.dart';

FirebaseUser user;

class LemonyCakesApp extends StatelessWidget {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInAnonymously() async{
    user = await firebaseAuth.signInAnonymously();
    print("Signed in as ${user.uid}");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: allTranslations.supportedLocales(),
      title: allTranslations.text('app_title'),
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: const Color(0xffbebeee),
        canvasColor: const Color(0xfffafafa),
        fontFamily: 'Roboto',
      ),
      home: _handleLogin(),
    );
  }

  Widget _handleLogin() {
    return new StreamBuilder<FirebaseUser>(
        stream: firebaseAuth.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            signInAnonymously();
            return Scaffold(
              backgroundColor: const Color(0xfff4bdd8),
              body: Center(
                child: Text(
                  allTranslations.text('loading'),
                  style: TextStyle(
                    fontFamily: 'KaushanScript',
                    fontSize: 25.0,
                    color: Colors.white
                  ),
                ),
              ),
            );
          } else {
            user = snapshot.data;
            return HomeScreen();
          }
        }
    );
  }

}

const double screenPadding = 15.0;
const double titlePaddingTop = 35.0;
const double titlePaddingLeft = 0.0;
const double titlePaddingRight = 0.0;
const double iconSize = 36.0;
const Color goldLogoColor = Color(0xffb5a628);
const Color cardTextColor = Colors.black45;
const Color textColor = Colors.black54;
const Color galleryCard = Color(0xfff4bdd8);
const Color recipesCard = Color(0xffade7eb);
const Color tutorialsCard = Color(0xffbebeee);
const Color customPink = Color(0xfff4bdd8);
const Color customGreen = Color(0xffade7eb);
const Color customPurple = Color(0xffbebeee);
const Color customRed = Color(0xffdd95a6);
const Color customBlue = Color(0xff9daff5);

const TextStyle titleTextStyle = TextStyle(
  color: goldLogoColor,
  fontFamily: 'KaushanScript',
  fontSize: 30.0,
);

const TextStyle cardTextStyle = TextStyle(
  color: cardTextColor,
  fontFamily: 'KaushanScript',
  fontSize: 24.0,
);

const BoxDecoration background = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      "assets/images/marca4.png",
    ),
    fit: BoxFit.contain,
  ),
);