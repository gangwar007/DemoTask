import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/home_page.dart';
import 'package:flutter_app_demo/routes.dart';
import 'package:flutter_app_demo/utils/app_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Demo',
      theme: new ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: AppStyles.blueColor,
        accentColor: AppStyles.blueColor,


      ),
      home:new HomePage(),
      routes: routes,
    );
  }




}