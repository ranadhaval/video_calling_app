import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_call_app/login.dart';

import 'home.dart';

void main() {
  runApp(My_Home_s());
}

class My_Home_s extends StatefulWidget {
  const My_Home_s({super.key});

  @override
  State<My_Home_s> createState() => _My_Home_sState();
}

class _My_Home_sState extends State<My_Home_s> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)),
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
    );
  }
}
