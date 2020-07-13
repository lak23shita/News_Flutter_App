import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF7986CB),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/peoplenews.jpg'),
        body: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Text(
            'News articles from around the world can all be accessed from one place .',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,

            ),
          ),
        ),
        title: Center(
          child: Text(
              'General',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
        ),

        titleTextStyle: TextStyle( color: Colors.white),
        bodyTextStyle: TextStyle( color: Colors.white),
        mainImage: Image.asset(
          'assets/peoplenews.jpg',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )
    ),

    PageViewModel(
      pageColor: const Color(0xFF7986CB),
      iconImageAssetPath: 'assets/laptop.jpg',
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          'Get to know the strategic technology trends that helps in saving time and money.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,

          ),
        ),
      ),
      title:  Text('Technology',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),),

      mainImage: Image.asset(
        'assets/laptop.jpg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),

    PageViewModel(
      pageColor: const Color(0xFF7986CB),
      iconImageAssetPath: 'assets/health.jpg',
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          'New updates and enhancements in medical fields and guidance from various nutritionists and health experts.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      title: Text('Health',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),),

      mainImage: Image.asset(
        'assets/health.jpg',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle( color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),

    PageViewModel(
      pageColor: const Color(0xFF7986CB),
      iconImageAssetPath: 'assets/tech.png',
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
            'Improved and advanced business strategies for upgrading and establishing greater market position.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,

            ),
          ),
        ),
      title: Text('Technology',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),),
      mainImage: Image.asset(
        'assets/tech.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello news', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
//          showNextButton: true,
//          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}