import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String image1 =
      'https://images.unsplash.com/photo-1669295235408-81174795bd87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';
  String image2 =
      'https://images.unsplash.com/photo-1669172461369-ada48f56f011?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80';

  String image3 =
      'https://images.unsplash.com/photo-1669218180914-aa25c243eb4b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  int currentImageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        if (currentImageNumber >= 3) {
          currentImageNumber = 1;
        } else {
          currentImageNumber++;
        }
      });
    });
  }

  String getImageUrl() {
    if (currentImageNumber == 1) {
      return image1;
    } else if (currentImageNumber == 2) {
      return image2;
    } else if (currentImageNumber == 3) {
      return image3;
    } else {
      return image1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Image.network(getImageUrl()),
        ));
  }
}
