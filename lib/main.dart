import 'package:flutter/material.dart';
import 'package:lemonycakes/src/app.dart';

void main() async {
  await allTranslations.init();

  runApp(LemonyCakesApp());
}
