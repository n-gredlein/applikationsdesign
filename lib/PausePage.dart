import 'package:flutter/material.dart';

import 'app_routes.dart';

class PausePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('PAUSE', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1),
                Column(
                  children: <Widget>[
                    SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Row(
                            children: const [
                              Icon(Icons.play_arrow),
                              Text("Fortsetzen",),
                            ],
                          ),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lime)),
                        )),
                    const Padding(padding: EdgeInsets.all(8.0),),
                    SizedBox(
                        width: 153,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, AppRoutes.start),
                          child: Row(
                            children: const [
                              Icon(Icons.close),
                              Text("Abbrechen",)
                            ],
                          ),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                        ))
                  ],
                ),
                FloatingActionButton(
                  child: const Icon(
                    Icons.info,
                    size: 50,
                  ),
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.info),
                ),
              ],
            ))
        )
    );
  }

}
