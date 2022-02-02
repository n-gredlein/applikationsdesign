import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
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
                Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text("INFO", style: Theme.of(context).textTheme.headline1)
                    ])),
                const SizedBox(
                  width: 300,
                  child: Text(
                    "Du kannst dich im Museum frei bewegen. Suche nach Sternen. Für jeden Stern bekommst du einen Buchstaben. Wenn du bei jeder Station gewesen bist, musst du die Buchstaben in der richtigen Reihenfolge eingeben. Dann hast du den Schatz gefunden",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                    width: 158,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Row(
                        children: const [
                          Text("Verstanden",
                              style: TextStyle(fontFamily: 'Pixellari')),
                          Icon(Icons.check),
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    )),
              ],
            ))));
  }
}
