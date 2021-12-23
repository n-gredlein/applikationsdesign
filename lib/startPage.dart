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
                    style: Theme.of(context).textTheme.headline1),
                Text('IM MUSEUM', style: Theme.of(context).textTheme.headline2),
                Image.asset('assets/images/ghost_right.png', scale: 0.15),
                Container(
                    width: 121,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Text(
                            "Starten",
                          )
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    )),
                FloatingActionButton(
                    child: Icon(
                      Icons.info,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.info);
                    },
                    elevation: 0.0),
              ],
            ))));
  }
}
