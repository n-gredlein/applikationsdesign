import 'package:flutter/material.dart';

import 'index.dart';

double getTextScale(BuildContext context) {
  return MediaQuery.of(context).size.width / 320.0;
}

TextConfig gameTextConf(BuildContext context, double faktor) {
  // double fakt = MediaQuery.of(context).textScaleFactor;
  double fakt = getTextScale(context) / faktor;
  return TextConfig(
      textAlign: TextAlign.left,
      fontSize: 15 * fakt,
      color: Colors.white,
      fontFamily: 'Pixellari');
}
