import 'package:flutter/material.dart';

AppBar customAppBar({required String image, required String title}) {
  return AppBar(
      title: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
      actions: [
        Padding(padding: const EdgeInsets.all(12), child: Image.asset(image))
      ]);
}
