import 'package:flutter/material.dart';
import 'package:flutter_application_kagan_gredlein/app_routes.dart';

class PausePage extends StatelessWidget {
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
                Text('PAUSE',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
                Column(
                  children: <Widget>[
                    Container(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.play_arrow),
                              Text(
                                "Fortsetzen",
                              )
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lime)),
                        )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    Container(
                        width: 153,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.start);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.close),
                              Text(
                                "Abbrechen",
                              )
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                        ))
                  ],
                ),
                FloatingActionButton(
                  child: Icon(
                    Icons.info,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.info);
                  },
                ),
              ],
            ))));
  }
}
