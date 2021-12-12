import "package:flutter/material.dart";

import 'home.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculator",
    theme: ThemeData(primarySwatch: Colors.indigo),
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
