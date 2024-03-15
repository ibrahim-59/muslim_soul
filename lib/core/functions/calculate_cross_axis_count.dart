import 'package:flutter/material.dart';

int calculateCrossAxisCount(BuildContext context, itemSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  int crossAxisCount =
      screenWidth ~/ itemSize; // Adjust 200 according to your item width
  return crossAxisCount;
}
