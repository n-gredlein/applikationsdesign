import 'package:flutter/material.dart';
import 'package:flutter_application_kagan_gredlein/app_routes.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/background.png"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Das kleine Gespenst im Museum',
                    style: TextStyle(fontFamily: 'Pixellari')),
                Image.asset('assets/images/ghost_right.png', scale: 0.2),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Starten',
                    style: TextStyle(fontFamily: 'Pixellari'),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.lime)),
                ),
                FloatingActionButton(
                    child: Icon(Icons.info),
                    onPressed: () {
                      debugPrint('movieTitle');
                      Navigator.pushNamed(context, AppRoutes.info);
                    },
                    backgroundColor: Colors.blue,
                    elevation: 0.0),
              ],
            ))));
  }
}








/*
void main() {
  runApp(const MyApp());
}

class StartPage extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/background.png"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Das kleine Gespenst im Museum',
                    style: TextStyle(fontFamily: 'Pixellari')),
                Image.asset('assets/images/ghost_right.png', scale: 0.2),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Starten',
                    style: TextStyle(fontFamily: 'Pixellari'),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.lime)),
                ),
                FloatingActionButton(
                    child: Icon(Icons.info),
                    onPressed: null,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0),
              ],
            ))));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: const AssetImage("assets/background.png"),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Das kleine Gespenst im Museum',
                        style: TextStyle(fontFamily: 'Pixellari')),
                    Image.asset('assets/images/ghost_right.png', scale: 0.2),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Starten',
                        style: TextStyle(fontFamily: 'Pixellari'),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    ),
                    FloatingActionButton(
                        child: Icon(Icons.info),
                        onPressed: null,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0),
                  ],
                )))));
  }
}*/
