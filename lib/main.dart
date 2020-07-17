import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HelloNews',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,),
        ),
        home: StartUp(),
    );
  }
}

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> with SingleTickerProviderStateMixin {
  AnimationController controllerBG;
  Animation animationBG;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 5),
            () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Intro()),
        ));

    // BG Animation
    controllerBG =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animationBG = ColorTween(
        begin: Colors.pink,
        end: Colors.blue) // Tween changes range of animation
        .animate(controllerBG);
    controllerBG.forward();
    controllerBG.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controllerBG.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: animationBG.value,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Center(
                child: Text(
                  'HelloNews',
                  style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w400,
                      )),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TypewriterAnimatedTextKit(
              text: ['YOUR 24x7 NEWS REPORTER'],
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      );
  }
}

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final pages = [
    PageViewModel(
        pageColor: Colors.blue,
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/people1.png'),
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
          'assets/people1.png',
          height: 340.0,
          width: 340.0,
          alignment: Alignment.center,
        )
    ),

    PageViewModel(
      pageColor: Colors.blue,
      iconImageAssetPath: 'assets/laptop1.png',
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
        'assets/laptop1.png',
        height: 340.0,
        width: 340.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),

    PageViewModel(
      pageColor: Colors.blue,
      iconImageAssetPath: 'assets/health1.png',
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
        'assets/health1.png',
        height: 300.0,
        width: 300.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle( color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(//ThemeData
        body: Builder(
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
      );
  }
}
