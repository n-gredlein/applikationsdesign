import 'package:flutter/material.dart';
import 'package:flutter_application_kagan_gredlein/app_routes.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('DAS KLEINE GESPENST',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Pixellari',
                        fontSize: 50,
                        color: Colors.white)),
                Text('IM MUSEUM',
                    style: TextStyle(
                        fontFamily: 'Pixellari',
                        fontSize: 20,
                        color: Colors.white)),
                Image.asset('assets/images/ghost_right.png', scale: 0.2),
                Container(
                    width: 102,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Text("Starten",
                              style: TextStyle(fontFamily: 'Pixellari'))
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    )),
                FloatingActionButton(
                    child: Icon(
                      Icons.info,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.info);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0.0),
              ],
            ))));
  }
}
